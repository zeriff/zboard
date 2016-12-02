class SearchInput extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className="ui right action left fluid icon input">
                <input type="text" placeholder="Search"/>
                <div className="ui basic floating dropdown button">
                    <div className="text">All</div>
                    <i className="dropdown icon"></i>
                    <div className="menu">
                        <div className="item">Users</div>
                        <div className="item">Pins</div>
                    </div>
                </div>
            </div>

        )
    }
}
