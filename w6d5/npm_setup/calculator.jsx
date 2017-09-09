import React from 'react';

class Calculator extends React.Component {
  constructor (props) {
    super(props);
    this.state = {result: 0, num1: 0, num2: 0};
  }

  setNum1(event) {
    // console.log(this.state);
    event.preventDefault();
    let firstNum = document.getElementById("num1");

    if (firstNum.value === "") {
      firstNum = "";
    } else {
      firstNum = parseInt(firstNum.value);
    }

    this.setState({num1: firstNum});
    // console.log(this.state);s
  }

  setNum2(event) {
    // console.log(this.state);
    event.preventDefault();
    let secondNum = document.getElementById("num2");

    if (secondNum.value === "") {
      secondNum = "";
    } else {
      secondNum = parseInt(secondNum.value);
    }

    this.setState({num2: secondNum});
    // console.log(this.state);s
  }

  calculate(event) {
    console.log(this.state);
    console.log(event.currentTarget.value);
    //get the operator and then put into result, the result of the expression.
    // let operator = document.getElementById("")
    if (event.currentTarget.value === "+") {
      this.setState({result: this.state.num1 + this.state.num2});

    } else if (event.currentTarget.value === "-"){
      this.setState({result: this.state.num1 - this.state.num2});

    } else if (event.currentTarget.value === "*"){
      this.setState({result: this.state.num1 * this.state.num2});

    } else if (event.currentTarget.value === "/"){
      this.setState({result: this.state.num1 / this.state.num2});

    }
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>

        <input id="num1"
               type="text"
               onChange={this.setNum1.bind(this)}
               value={this.state.num1}></input>
             <input id="num2"
               type="text"
               onChange={this.setNum2.bind(this)}
               value={this.state.num2}></input>

             <br/>
               <input type="submit"
                      value="+"
                      onClick={this.calculate.bind(this)}>
               </input>
               <input type="submit"
                      value="-"
                      onClick={this.calculate.bind(this)}>
               </input>
               <input type="submit"
                      value="*"
                      onClick={this.calculate.bind(this)}>
               </input>
               <input type="submit"
                      value="/"
                      onClick={this.calculate.bind(this)}>
               </input>
      </div>
    );
  }
}

export default Calculator;
