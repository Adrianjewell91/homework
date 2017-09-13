import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {

  constructor(props) {
    super(props);
    this.state = {searchTerm: ""};
  }

  handleSubmit(e) {
    e.preventDefault();
    
  }

  updateValue(e) {
    this.setState({searchTerm: e.currentTarget.value});
    console.log(this.state);
  }

  render() {
    return (
      <div>
        <form onSubmit={this.handleSubmit.bind(this)}>
          <label>Enter Search
            <input type="test" value={this.state.searchTerm}
                   onChange={this.updateValue.bind(this)}></input>
          </label>
          <button>Submit</button>
        </form>

      </div>
    );
  }

}

export default GiphysSearch;
