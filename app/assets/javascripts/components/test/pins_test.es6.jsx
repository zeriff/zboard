class PinsTest extends React.Component {
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
                <PinTest key={Math.random()} pin={item}></PinTest>
            )
        });
    }

    componentDidMount() {
        masonry.bind("pinstest", "pintest");
    }
    componentDidUpdate() {
        masonry.reload("pinstest")
    }
    render() {

        return (
            <div className="">
                <div className="pinstest transitions-enabled" style={{
                    margin: "auto"
                }}>
                    {this._renderPin()}
                </div>
                <Pagination {...this.state}></Pagination>
            </div>
        )
    }
}
