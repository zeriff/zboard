class UserList extends React.Component {
    constructor(props) {
        super(props);
    }
    componentDidMount() {
        masonry.bind("users", "box");
    }
    componentDidUpdate() {
        if (this.props.data.length > 0) {
            masonry.reload("users");
        }
    }

    _renderUsers() {
        return this.props.data.map(function(user) {
            return (
                <User key={Math.random()} user={user}></User>
            )
        });
    }
    render() {
        return (
            <div className="users transitions-enabled" style={{
                margin: "auto"
            }}>
                {this._renderUsers()}
            </div>
        )
    }
}
