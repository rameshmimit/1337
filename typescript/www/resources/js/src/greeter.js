var Student = (function () {
    function Student(firstname, middleinitial, lastname) {
        this.firstname = firstname;
        this.middleinitial = middleinitial;
        this.lastname = lastname;
        this.fullname = firstname + " " + middleinitial + " " + lastname;
    }
    return Student;
})();
function greeter(person) {
    return "Hello, " + person.firstname + " " + person.lastname;
}
var p = new Person([
    1, 
    1, 
    1
], "hi");
var user = new Student("Jane", "M.", "User");
document.body.innerHTML = greeter(user);
