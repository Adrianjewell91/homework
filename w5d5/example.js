// const readline = require('readline');
//
// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });
//
// reader.question("What is your name?", function (answer) {
//   console.log(`Hello ${answer}!`);
//
//   // Close the reader, which will allow the program to end because it
//   // is no longer waiting for any events.
//   reader.close();
// });
//
// console.log("Last program line");

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits (callback) {
  let first, second;

  reader.question('Would you like some tea?', (res) => {
    first = res;
    console.log(`You replied ${res}.`);

    reader.question('Would you like some biscuits?', (res) => {
      second = res;
      console.log(`You replied ${res}.`);

      const firstRes = (first === 'yes') ? 'do' : 'don\'t';
      const secondRes = (second === 'yes') ? 'do' : 'don\'t';

      callback(firstRes,secondRes)
    });
  });

}

teaAndBiscuits( function (firstRes,secondRes) {
  console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
  reader.close();
});


// function addTwoNumbers(callback) {
//   // Notice how nowhere do I return anything here! You never return in
//   // async code. Since the caller will not wait for the result, you
//   // can't return anything to them.
//
//   reader.question("Enter #1: ", function (numString1) {
//     reader.question("Enter #2: ", function (numString2) {
//       const num1 = parseInt(numString1);
//       const num2 = parseInt(numString2);
//
//       callback(num1 + num2);
//     });
//   });
// }
//
// addTwoNumbers(function (result) {
//   console.log(`The result is: ${result}`);
//   reader.close();
// });
