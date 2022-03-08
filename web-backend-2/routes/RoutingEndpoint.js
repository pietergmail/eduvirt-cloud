var exec = require('child_process').exec;


class Machine {
    constructor(mName, mLoader, mCores, mRAM, mIP, mStatus, mCourse)
    {
        this.mName = mName;
        this.mLoader = mLoader;
        this.mCores = mCores;
        this.mRAM = mRAM;
        this.mIP = mIP;
        this.mStatus = mStatus;
        this.mCourse = mCourse;
    }
}

// hardcoded for now
const users = 
[
{"username": "user1", "password": "pass1", "machines": []}
,{"username": "admin", "password": "admin", "machines": []}
];
const courses = [{"courseName": "Netwerken-1"},{"courseName": "Netwerken-2"},{"courseName": "Systeembeheer"}];
const templates = [{"name": "Windows-10"},{"name": "Windows-Server-2022"},{"name": "Ubuntu"}, {"name": "FreeBSD"}];


const defaultMachineUser = users.find(user => user.username === "user1");
defaultMachineUser.machines.push(new Machine("DefaultOS", "defaultloader", "2", "8G", "192.0.0.1", "running", "defaultcourse"));

const defaultMachineAdmin = users.find(user => user.username === "admin");
defaultMachineAdmin.machines.push(new Machine("DefaultOS", "defaultloader", "2", "8G", "192.0.0.1", "running", "Admin"));
// hardcoded for now







const loginUser = (req, res) => {
    const user = users.find(user => user.username === req.body.username && user.password === req.body.password);
    if (user) {
        res.status(200).json(user);
    } else {
        res.status(200).json({ message: 'User not found' });
    }
};

const getUsers = (req, res) => {
    res.send(users);
};

const getUserWithUsername = (req, res) => {
    const user = users.find(user => user.username === req.body.username);
    res.send(user.machines);
};

const getCourses = (req, res) => {
    res.send(courses);
};

const getTemplates = (req, res) => {
    res.send(templates);
};

// Methode die alle machines krijgen van een user met de username, deze methode voert een bash commando uit dat alle machines grep't van de user
const getMachinesOfUser = (req, res) => {

  const user = users.find(user => user.username === req.body.username);

  if(user.username.includes("admin")){
  // exec bash commando om alle machines van de user op te halen
  exec('vm list | sed "s/  */ /g" | tail -n +2',
  function (error, stdout, stderr) {
    console.log('stdout: ' + stdout);
    console.log('stderr: ' + stderr);

  // hardcoded machines om te testen
  //   stdout = "user1_Ubuntu default uefi 2 8G - No Stopped\n" +
  //   "user1_Ubuntu default uefi 2 8G - No Stopped"

  // altijd de machine array van de user leegmaken
  var machines = [];
  //elke lijn uit de output van het bash commando wordt hier geparsed in een nieuwe machine array die dan naar de website word gestuurd
  var lines = stdout.split("\n");
  for (var i = 0; i < lines.length; i++) {
      var words = lines[i].split(" ");
          var mName = words[0];
          var mLoader = words[2];
          var mCores = words[3];
          var mRAM = words[4];
          var mIP = words[5];
          var mStatus = words[7];
          var mCourse = "";
         machines.push(new Machine(mName, mLoader, mCores, mRAM, mIP, mStatus, mCourse));
      
  }
      
    res.send(machines);
    if (error !== null) {
      console.log('exec error: ' + error);
    }
  });
  }
  else{

  // exec bash commando om alle machines van de user op te halen
  exec('vm list | grep ' + req.body.username + ' | sed "s/  */ /g"',
  function (error, stdout, stderr) {
    console.log('stdout: ' + stdout);
    console.log('stderr: ' + stderr);

  // hardcoded machines om te testen
  //   stdout = "user1_Ubuntu default uefi 2 8G - No Stopped\n" +
  //   "user1_Ubuntu default uefi 2 8G - No Stopped"

  // altijd de machine array van de user leegmaken
  var machines = [];
  //elke lijn uit de output van het bash commando wordt hier geparsed in een nieuwe machine array die dan naar de website word gestuurd
  var lines = stdout.split("\n");
  for (var i = 0; i < lines.length; i++) {
      var words = lines[i].split(" ");
          var mName = words[0];
          var mLoader = words[2];
          var mCores = words[3];
          var mRAM = words[4];
          var mIP = words[5];
          var mStatus = words[7];
          var mCourse = "";
         machines.push(new Machine(mName, mLoader, mCores, mRAM, mIP, mStatus, mCourse));
      
  }
      
    res.send(machines);
    if (error !== null) {
      console.log('exec error: ' + error);
    }
  });
}
};


// Nomad komt hier in
const createMachine = (req, res) => {
    const user = users.find(user => user.username === req.body.username);
    user.machines.push({"mName": req.body.mName, "mCourse": req.body.mCourse});

    

    // script to create machine
    exec('bash /home/t/eduvirt-cloud/web-backend-2/nomad/script.sh ' + req.body.mName + ' ' + req.body.username + ' ' + req.body.mCourse,
  function (error, stdout, stderr) {
    console.log('stdout: ' + stdout);
    console.log('stderr: ' + stderr);
    if (error !== null) {
      console.log('exec error: ' + error);
    }
    });
// end script to make machine

    res.send(users);
};

const startVM = (req, res) => {
    exec('vm start ' + req.body.mName,
    function (error, stdout, stderr) {
      console.log('stdout: ' + stdout);
      console.log('stderr: ' + stderr);
      if (error !== null) {
        console.log('exec error: ' + error);
      }
      });
    res.send(req.body.mName + " started");
}

const stopVM = (req, res) => {
    exec('vm stop ' + req.body.mName,
    function (error, stdout, stderr) {
      console.log('stdout: ' + stdout);
      console.log('stderr: ' + stderr);
      if (error !== null) {
        console.log('exec error: ' + error);
      }
      });
    res.send(req.body.mName + " stopped");
}
  
module.exports = {
    getUsers,
    getUserWithUsername,
    getCourses,
    getTemplates,
    createMachine,
    loginUser,
    getMachinesOfUser,
    startVM,
    stopVM,
  }
