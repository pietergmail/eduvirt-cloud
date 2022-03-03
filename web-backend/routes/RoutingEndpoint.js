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
const templates = [{"name": "Windows-10"},{"name": "Windows-Server-2022"},{"name": "Mint"}, {"name": "FreeBSD"}];


const defaultMachineUser = users.find(user => user.username === "user1");
defaultMachineUser.machines.push(new Machine("FreeBSD", "bhyveloader", "2", "8", "192.0.0.1", "running", "systeembeheer"));

const defaultMachineAdmin = users.find(user => user.username === "admin");
defaultMachineAdmin.machines.push(new Machine("FreeBSD", "bhyveloader", "2", "8", "192.0.0.1", "running", "Admin"));
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


const getMachinesOfUser = (req, res) => {

    const user = users.find(user => user.username === req.body.username);
    exec('vm list | grep ' + req.body.username,
    function (error, stdout, stderr) {
      console.log('stdout: ' + stdout);
      console.log('stderr: ' + stderr);
      const machines = []
     // stdout = "FreeBSD bhyveloader 2 8 192.0.0.1 running systeembeheer" + "\n" + "pepegaOS pepeloader 2 16 192.0.0.1 stopped systeembeheer"

    //   get every line of stdout and put every word in a new machine
        stdout.split("\n").forEach(line => {
            const words = line.split(" ");
            const machine = new Machine(words[0], words[1], words[2], words[3], words[4], words[5], words[6]);
            machines.push(machine);
        });
      
      res.send(machines);
      if (error !== null) {
        console.log('exec error: ' + error);
      }
    });
};


// Nomad komt hier in
const createMachine = (req, res) => {
    const user = users.find(user => user.username === req.body.username);
    user.machines.push({"mName": req.body.mName, "mCourse": req.body.mCourse});

    

    // script to create machine
    exec('nomad job run -var=\"templateName=' + req.body.mName + '\" -var=\"userName=' + req.body.username + '\" -var=\"courseName=' + req.body.mCourse + '\" /home/t/eduvirt-cloud/web-backend/nomad/job.nomad',
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

  
module.exports = {
    getUsers,
    getUserWithUsername,
    getCourses,
    getTemplates,
    createMachine,
    loginUser,
    getMachinesOfUser,
  }
