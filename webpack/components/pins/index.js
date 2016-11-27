import React from 'react';
import {connect} from 'react-redux';
import Pin from './pin';
import {loadPins} from './../../actions'
import Masonry from 'react-masonry-component';

class Pins extends React.Component {
    constructor(props) {
        super(props);
        this.counter = 0;
    }

    _pins() {
        return this.props.data.pins.map(function(pin) {
            return <Pin key={Math.random()} {...pin}></Pin>
        })
    }
    componentWillMount() {
        this.props.loadPins();
    }
    componentDidMount() {
        this.props.loadPins();
    }
    render() {
        return (
            <div className="ui container">
                <Masonry className="pins">
                    {this._pins()}
                </Masonry>
            </div>
        )
    }
}

const mapStateToProps = function(state) {
    return {data: state.pins}
}

export default connect(mapStateToProps, {loadPins})(Pins)
