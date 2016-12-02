class SaveButton extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            saved: false
        }
    }

    componentWillMount() {
        let me = this;
        axios.get('/save/status/' + this.props.pin.id).then(me.setStateWithRes.bind(this));
    }
    setStateWithRes(res) {
        if (res.status == 200) {
            this.setState(res.data)
        }
    }
    catchRes(res) {
        toastr.error(res.data.msg);
    }
    _createSave() {
        let me = this;
        axios.get('/save/' + this.props.pin.id).then(me.setStateWithRes.bind(this)).catch(me.catchRes);
    }

    _destroySave() {
        let me = this;
        axios.delete('/save/' + this.props.pin.id, {
            headers: {
                'X-CSRF-Token': TokenMgr.getCSRFToken()
            }
        }).then(me.setStateWithRes.bind(this));
    }
    render() {
        if (this.state.saved) {
            return (
                <div onClick={this._destroySave.bind(this)} className="ui mini blue right floated button">Saved</div>
            )
        } else {
            return (
                <div onClick={this._createSave.bind(this)} className="ui mini basic right floated button">Save</div>
            )
        }

    }
}

// - if user_signed_in? && (current_user.saved_for? savable)
//   = link_to "Saved", save_path(savable), method: :delete, remote: true, data: { noblock: true}, class: "ui mini right floated blue button"
// - else
//   = link_to "Save", saves_path(savable), remote: true, data: { noblock: true}, class: "ui mini right floated basic button"
