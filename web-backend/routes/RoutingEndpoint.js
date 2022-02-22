

// hardcoded for now
const users = 
[
{"username": "user1", "password": "pass1", "machines": [{"machineName": "hadige mint", "templateName": "Mint", "courseName": "Systeembeheer"}, {"machineName": "server voor netwerken 2", "templateName": "Windows Server 2022", "courseName": "Netwerken-2"}]}
,{"username": "admin", "password": "admin", "machines": [{"machineName": "Admin Machine", "templateName": "Mint", "courseName": "Admin"}]}
];
const courses = [{"courseName": "Netwerken-1"},{"courseName": "Netwerken-2"},{"courseName": "Systeembeheer"}];
const templates = [{"name": "Windows 10"},{"name": "Windows Server 2022"},{"name": "Mint"}, {"name": "FreeBSD"}];
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


// Nomad komt hier in
const createMachine = (req, res) => {
    const user = users.find(user => user.username === req.body.username);
    user.machines.push({"machineName": req.body.machineName, "templateName": req.body.templateName, "courseName": req.body.courseName});
    res.send(users);
};

  
module.exports = {
    getUsers,
    getUserWithUsername,
    getCourses,
    getTemplates,
    createMachine,
    loginUser,
  }