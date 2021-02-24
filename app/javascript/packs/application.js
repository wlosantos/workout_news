import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import './flashMessages'
import "./custom"

Rails.start()
ActiveStorage.start()

import 'bulma/bulma'
import "@fortawesome/fontawesome-free/js/all";
import '../src/application.scss'
