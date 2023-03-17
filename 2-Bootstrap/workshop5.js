class Student {
    constructor(name, email){
        this.name = name;
        this.email = email;
    }
}

class Bootcamp {
    constructor(name, level, students = []){
        this.name = name;
        this.level = level;
        this.students = students;
    }
    registerStudent(studentToRegister) {
        if (!studentToRegister.name || !studentToRegister.email){
            console.log("Invalid name or email");
            return false;
        } else {
            for (const student of this.students){
                if (student.email === studentToRegister.email){
                    console.log("Email already exists for another student");
                    return false;
                }
            }
            this.students.push(studentToRegister);
            console.log(`${studentToRegister.name} was successfully registered to ${this.name}!`);
            return true;
        }
    }
    listStudents() {
        if (this.students.length === 0){
            console.log(`No students are registered to the ${this.name} bootcamp.`);
            return false;
        } else {
            console.log(`The students registered in ${this.name} are: `);
            for (const student of this.students){
                console.log(student.name);
            }
            return true;
        }
    }
    getInfo() {
        console.log(`Name: ${this.name}, Level: ${this.level}`);
    }
    removeStudent(studentToRemove) {
        for (const student of this.students) {
            if (student.email == studentToRemove){
                this.students.splice(this.students.indexOf(student), 1);
                console.log(`${student.name} has been removed`);
                return true;
            }
        }
        console.log(`A student with the email: ${studentToRemove} does not exist`);
        return false;
    }
}

testStudent = new Student('Bugs Bunny', 'bugs@bunny.com');
console.log(testStudent);
if ( testStudent.name === 'Bugs Bunny' && testStudent.email === 'bugs@bunny.com') {
    console.log('TASK 1: PASS');
}

reactBootcamp = new Bootcamp("React", "Advanced");
console.log(reactBootcamp);
if ( reactBootcamp.name === 'React' && reactBootcamp.level === 'Advanced'
        && Array.isArray(reactBootcamp.students) && reactBootcamp.students.length === 0) {
    console.log('TASK 2: PASS');
}

const runTest = (bootcamp, student) => {
    const attemptOne = bootcamp.registerStudent(student);
    const attemptTwo = bootcamp.registerStudent(student);
    const attemptThree = bootcamp.registerStudent(new Student("Babs Bunny"));
    if ( attemptOne && !attemptTwo && !attemptThree) {
        console.log("TASK 3: PASS");
    }

    bootcamp.registerStudent(new Student('Babs Bunny', 'babs@bunny.com'));
    if (bootcamp.listStudents()) {
        console.log("TASK 4: PASS 1/2");
        
        // testing remove function
        console.log(bootcamp.students.length)
        bootcamp.removeStudent(student.email);
        bootcamp.removeStudent(student.email);
        console.log(bootcamp.students.length);
    }
    bootcamp.students = [];
    if (!bootcamp.listStudents()) {
        console.log("TASK 4: PASS 2/2");
    }
};

runTest(reactBootcamp, testStudent);