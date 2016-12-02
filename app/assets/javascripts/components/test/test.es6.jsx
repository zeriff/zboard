class Test extends React.Component {
    _mainrender() {
        return this.props.pins.map(function(item) {
            return (
                <div key={Math.random()}>{item.content}</div>
            )
        })
    }
    render() {

        return (
            <div>{this._mainrender()}</div>
        )
    }
}
