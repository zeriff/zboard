class Pins extends React.Component {
    constructor(props) {
        super(props);
        this.state = props.data;
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
        axios.get('/?page=' + this.state.next_page).then(this.setStateWithRes.bind(this));
    }

    componentDidMount() {
        masonry.bind("pins", "box");
    }
    componentDidUpdate() {
        masonry.reload("pins")
    }
    render() {

        return (
            <div>
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
