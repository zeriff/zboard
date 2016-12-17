class Pins extends React.Component {
    constructor(props) {
        super(props);
        this.state = props.data
    }

    setStateWithRes(res) {
        if (res.status == 200) {
            this.setState(res.data)
        }
    }

    _renderPin() {
        return this.state.pins.map(function(item) {
            return (
                <Pin key={Math.random()} pin={item}></Pin>
            )
        });
    }
    _loadPins() {
        let me = this;
        axios.get('/api/get_saved?page=' + this.state.next_page).then(function(res) {
            me.setState({
                pins: me.state.pins.concat(res.data.pins),
                next_page: res.data.next_page
            })
        });
    }

    // componentWillMount() {
    //     axios.get('/api/get_saved').then(this.setStateWithRes.bind(this));
    // }

    componentDidMount() {
        masonry.bind("pins", "box");
    }
    componentDidUpdate() {
        masonry.reload("pins")
    }
    render() {

        return (
            <div className="ui container">
                <div className="pins transitions-enabled" style={{
                    margin: "auto"
                }}>
                    {this._renderPin()}
                </div>
                <Pagination {...this.state}></Pagination>
            </div>
        )
    }
}
