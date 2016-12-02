class LikeButton extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            liked: false,
            likesCount: 0
        }
    }
    componentWillMount() {
        let me = this;
        axios.get('/like/status/' + this.props.pin.id).then(me.setStateWithRes.bind(this));
    }

    setStateWithRes(res) {
        if (res.status == 200) {
            this.setState(res.data)
        }
    }
    catchRes(res) {
        toastr.error(res.data.msg);
    }

    _createLike() {
        let me = this;
        axios.get('/like/' + this.props.pin.id).then(me.setStateWithRes.bind(this)).catch(me.catchRes.bind(this));
    }

    _destroyLike() {
        let me = this;
        axios.delete('/like/' + this.props.pin.id, {
            headers: {
                'X-CSRF-Token': TokenMgr.getCSRFToken()
            }
        }).then(me.setStateWithRes.bind(this));
    }

    render() {

        if (this.state.liked) {
            return (
                <span>
                    <i onClick={this._destroyLike.bind(this)} className="large heart like red icon"></i>
                    {this.state.likesCount}
                </span>
            )
        } else {
            return (
                <span>
                    <i onClick={this._createLike.bind(this)} className="large heart outline like icon"></i>
                    {this.state.likesCount}
                </span>
            )
        }

    }
}
