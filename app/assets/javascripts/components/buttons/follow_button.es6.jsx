class FollowButton extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            following: false
        }
    }
    componentWillMount() {
        let me = this;
        axios.get('/follow/status/' + this.props.user.id).then(function(res) {
            me.setState(res.data);
        });
    }
    _createFollow() {
        let me = this;
        axios.get('/follow/' + this.props.user.id).then(function(res) {
            me.setState(res.data);
        });
    }
    _destroyFollow() {
        let me = this;
        axios.delete('/follow/' + this.props.user.id, {
            headers: {
                'X-CSRF-Token': TokenMgr.getCSRFToken()
            }
        }).then(function(res) {
            me.setState(res.data);
        });
    }
    render() {
        if (this.state.following) {
            return (
                <div onClick={this._destroyFollow.bind(this)} className="ui mini blue button">Following</div>
            )
        } else {
            return (
                <div onClick={this._createFollow.bind(this)} className="ui mini basic button">Follow</div>
            )
        }
    }
}
