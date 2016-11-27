import React, {Component} from 'react';
import ReactDOM from 'react-dom';
import {connect} from 'react-redux';
import {loadPins} from './../actions'
class App extends Component {
    constructor(props) {
        super(props)
        this.contentStyle = {
            marginTop: '60px'
        }
    }
    handleClick() {
        this.props.loadPins();
    }
    render() {
        return (
            <div>
                <div className="ui top fixed mini borderless menu">
                    <div className="ui container">
                        <a className="item" href="/">
                            <img src="/logo.png"></img>
                        </a>
                        <div className="right menu">
                            <div className="item ui floating dropdown button">
                                sujan_evo
                                <div className="menu">
                                    <div className="item" onClick={this.handleClick.bind(this)}>Profile</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style={this.contentStyle}>
                    {this.props.children}
                </div>
            </div>
        )
    }
}

export default connect(null, {loadPins})(App)

// -#     %div.ui.top.fixed.tiny.borderless.menu
// -#       %div.ui.container
// -#         %div.item
