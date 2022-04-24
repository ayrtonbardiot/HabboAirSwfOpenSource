// by nota

//com.sulake.habbo.navigator.inroom.RoomEventViewCtrl

package com.sulake.habbo.navigator.inroom
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.navigator._SafeStr_1697;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.navigator.TextFieldManager;
    import _-Ja._SafeStr_1574;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-M1k._SafeStr_138;
    import _-M1k._SafeStr_877;
    import _-91q._SafeStr_1048;
    import _-Q1p._SafeStr_337;
    import com.sulake.core.window._SafeStr_3109;

    public class RoomEventViewCtrl implements _SafeStr_13 
    {

        private var _navigator:_SafeStr_1697;
        private var _window:_SafeStr_3263;
        private var _SafeStr_4802:TextFieldManager;
        private var _SafeStr_4803:TextFieldManager;

        public function RoomEventViewCtrl(_arg_1:_SafeStr_1697)
        {
            _navigator = _arg_1;
        }

        public function dispose():void
        {
            _navigator = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_4802 = null;
            _SafeStr_4803 = null;
        }

        public function get disposed():Boolean
        {
            return (_navigator == null);
        }

        public function show():void
        {
            if (((!(_window == null)) && (_window.visible)))
            {
                _window.visible = false;
                return;
            };
            prepareWindow();
            clearErrors();
            var _local_1:_SafeStr_1574 = _navigator.data.roomEventData;
            if (_local_1 == null)
            {
                createEvent();
            }
            else
            {
                editEvent(_local_1);
            };
            _window.visible = true;
            _window.activate();
        }

        private function editEvent(_arg_1:_SafeStr_1574):void
        {
            _window.caption = _navigator.getText("navigator.eventsettings.editcaption");
            _SafeStr_4802.setText(_arg_1.eventName);
            _SafeStr_4803.setText(_arg_1.eventDescription);
        }

        private function createEvent():void
        {
            _window.caption = _navigator.getText("navigator.createevent");
            _SafeStr_4803.goBackToInitialState();
            _SafeStr_4802.goBackToInitialState();
        }

        private function getInput(_arg_1:String):ITextFieldWindow
        {
            return (ITextFieldWindow(_window.findChildByName(_arg_1)));
        }

        private function onClose(_arg_1:_SafeStr_3116):void
        {
            close();
        }

        private function save():void
        {
            var _local_1:int = _navigator.data.roomEventData.adId;
            var _local_3:String = _SafeStr_4802.getText();
            var _local_2:String = _SafeStr_4803.getText();
            if (!isMandatoryFieldsFilled())
            {
                return;
            };
            _navigator.send(new _SafeStr_138(_local_1, _local_3, _local_2));
        }

        private function onEndButtonClick(_arg_1:_SafeStr_3116):void
        {
            _navigator.send(new _SafeStr_877(_navigator.data.roomEventData.adId));
            close();
        }

        private function onCancelButtonClick(_arg_1:_SafeStr_3116):void
        {
            close();
        }

        private function onUnfocus(_arg_1:_SafeStr_3116):void
        {
            if (_navigator.data.roomEventData != null)
            {
                save();
            };
        }

        private function onRoomAdError(_arg_1:_SafeStr_337):void
        {
            this.clearErrors();
            var _local_2:_SafeStr_1048 = _arg_1.getParser();
            var _local_3:int = _local_2.errorCode;
            if (_local_3 == 0)
            {
                _SafeStr_4802.displayError(_navigator.getText("roomad.error.0.description"));
                _SafeStr_4802.setText(_local_2.filteredText);
            }
            else
            {
                if (_local_3 == 1)
                {
                    _SafeStr_4803.displayError(_navigator.getText("roomad.error.0.description"));
                    _SafeStr_4803.setText(_local_2.filteredText);
                };
            };
        }

        private function isMandatoryFieldsFilled():Boolean
        {
            this.clearErrors();
            if (!_SafeStr_4802.checkMandatory(_navigator.getText("navigator.eventsettings.nameerr")))
            {
                return (false);
            };
            return (true);
        }

        private function clearErrors():void
        {
            _SafeStr_4802.clearErrors();
            _SafeStr_4803.clearErrors();
        }

        private function prepareWindow():void
        {
            if (_window != null)
            {
                return;
            };
            _window = _SafeStr_3263(_navigator.getXmlWindow("iro_event_settings"));
            addMouseClickListener(_window.findChildByTag("close"), onClose);
            _SafeStr_4802 = new TextFieldManager(_navigator, getInput("event_name"), 25);
            _SafeStr_4803 = new TextFieldManager(_navigator, getInput("event_desc"), 100);
            _SafeStr_4802.input.addEventListener("WE_UNFOCUSED", onUnfocus);
            _SafeStr_4803.input.addEventListener("WE_UNFOCUSED", onUnfocus);
            _navigator.communication.addHabboConnectionMessageEvent(new _SafeStr_337(onRoomAdError));
            _window.center();
        }

        private function addMouseClickListener(_arg_1:_SafeStr_3109, _arg_2:Function):void
        {
            if (_arg_1 != null)
            {
                _arg_1.addEventListener("WME_CLICK", _arg_2);
            };
        }

        private function find(_arg_1:String):_SafeStr_3109
        {
            var _local_2:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_2 == null)
            {
                throw (new Error((("Window element with name: " + _arg_1) + " cannot be found!")));
            };
            return (_local_2);
        }

        private function prepareEventTypes():void
        {
            var _local_2:int;
            var _local_4:* = null;
            var _local_1:* = null;
            var _local_3:Array = [];
            var _local_5:int = 100;
            _local_2 = 1;
            while (_local_2 < _local_5)
            {
                _local_4 = ("roomevent_type_" + _local_2);
                _local_1 = _navigator.getText(_local_4);
                if (((_local_1 == null) || (_local_1 == _local_4))) break;
                _local_3.push(_local_1);
                _local_2++;
            };
        }

        public function close():void
        {
            if (_window != null)
            {
                _window.visible = false;
            };
        }


    }
}//package com.sulake.habbo.navigator.inroom

// _SafeStr_1048 = "_-nT" (String#32264, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_138 = "_-C6" (String#30181, DoABC#4)
// _SafeStr_1574 = "_-e1X" (String#10654, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_337 = "_-Px" (String#23302, DoABC#4)
// _SafeStr_4802 = "_-812" (String#5803, DoABC#4)
// _SafeStr_4803 = "_-422" (String#6037, DoABC#4)
// _SafeStr_877 = "_-k1n" (String#31174, DoABC#4)


