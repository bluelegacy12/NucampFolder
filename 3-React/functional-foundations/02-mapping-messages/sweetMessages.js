const messages = [
    'how are you doing',
    'what are you up to',
    'would you like to get a bite later'
];

// const sweetMessages = [
//     'how are you doing, sweetie?',
//     'what are you up to, sweetie?',
//     'would you like to get a bite later, sweetie?',
// ];
/*const sweetMessages = [];
function convertMessages(msg) {
    for (m of msg) {
        sweetMessages.push(`${m}, sweetie?`);
    }
}

convertMessages(messages);
console.log(sweetMessages);*/

const sweetMessages = messages.map((message) => `${message}, sweetie?`);
console.log(sweetMessages);