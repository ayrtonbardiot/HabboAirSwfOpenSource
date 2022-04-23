// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.demo._SafeStr_3233

package com.sulake.habbo.communication.demo
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.habbo.communication.login.ILoginViewer;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Dictionary;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components.ITextFieldWindow;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.login.AvatarData;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.habbo.utils.CommunicationUtils;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components._SafeStr_3284;
    import flash.events.Event;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.habbo.communication.login._SafeStr_34;
    import com.sulake.core.window.components.*;

    [SecureSWF(rename="true")]
    public class _SafeStr_3233 extends EventDispatcherWrapper implements ILoginViewer 
    {

        public static const INIT_LOGIN:String = "INIT_LOGIN";
        public static const AVATAR_SELECTED:String = "AVATAR_SELECTED";
        public static const ENVIRONMENT_SELECTED:String = "ENVIRONMENT_SELECTED";

        private var _SafeStr_5113:_SafeStr_19;
        private var _SafeStr_5108:_SafeStr_1695;
        private var _SafeStr_5107:_SafeStr_21;
        private var _SafeStr_4003:IModalDialog;
        private var _window:_SafeStr_3133;
        private var _firstTryUsingExistingSession:Boolean = false;
        public var name:String = "";
        public var password:String = "";
        private var _SafeStr_8367:Dictionary;
        private var _SafeStr_5114:_SafeStr_3109;
        private var _loginButton:_SafeStr_3122;
        private var _SafeStr_5111:ITextFieldWindow;
        private var _SafeStr_5112:ITextFieldWindow;
        private var _SafeStr_5110:_SafeStr_3337;
        private var _SafeStr_3911:int;
        private var _SafeStr_5115:Vector.<AvatarData>;
        private var _SafeStr_5109:AvatarData;

        public function _SafeStr_3233(_arg_1:_SafeStr_19, _arg_2:_SafeStr_21, _arg_3:_SafeStr_1695)
        {
            _SafeStr_5113 = _arg_1;
            _SafeStr_5107 = _arg_2;
            _SafeStr_5108 = _arg_3;
            _SafeStr_8367 = new Dictionary();
            _SafeStr_4003 = getModalXmlWindow("login_window", _SafeStr_5107, _SafeStr_5108, "");
            _window = (_SafeStr_4003.rootWindow as _SafeStr_3133);
            createWindow();
        }

        public static function getModalXmlWindow(_arg_1:String, _arg_2:_SafeStr_21, _arg_3:_SafeStr_1695, _arg_4:String="_xml"):IModalDialog
        {
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_6:IModalDialog;
            try
            {
                _local_7 = _arg_2.getAssetByName((_arg_1 + _arg_4));
                _local_5 = XmlAsset(_local_7);
                _local_6 = _arg_3.buildModalDialogFromXML(XML(_local_5.content));
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("Communication", (((("Failed to build modal window " + _arg_1) + "_xml, ") + _local_7) + "!"));
                throw (e);
            };
            return (_local_6);
        }


        public function get avatarId():int
        {
            return (_SafeStr_3911);
        }

        public function get selectedAccount():AvatarData
        {
            return (_SafeStr_5109);
        }

        public function get selectedEnvironment():String
        {
            return (_SafeStr_5110.selectedEnvironment);
        }

        override public function dispose():void
        {
            super.dispose();
            if (_SafeStr_4003)
            {
                _SafeStr_4003.dispose();
                _SafeStr_4003 = null;
            };
            if (_SafeStr_5110)
            {
                _SafeStr_5110.removeEventListener("ENVIRONMENT_SELECTED_EVENT", onEnvironmentSelected);
                _SafeStr_5110.dispose();
                _SafeStr_5110 = null;
            };
            _SafeStr_8367 = null;
        }

        public function closeLoginWindow():void
        {
            if (_SafeStr_4003)
            {
                _SafeStr_4003.dispose();
                _SafeStr_4003 = null;
            };
        }

        public function get useWebApi():Boolean
        {
            var _local_1:ISelectableWindow = (_window.findChildByName("useTicket") as ISelectableWindow);
            if (_local_1 != null)
            {
                return (_local_1.isSelected);
            };
            return (false);
        }

        public function get useExistingSession():Boolean
        {
            return (false);
            return (false); //dead code
        }

        private function createWindow():void
        {
            _window.center();
            _window.caption = (_window.caption + " (air)");
            _window.findChildByName("useExistingSession").disable();
            _window.findChildByName("useExistingSession").blend = 0.5;
            _loginButton = (_window.findChildByName("login_btn") as _SafeStr_3122);
            _SafeStr_5111 = (_window.findChildByName("name_field") as ITextFieldWindow);
            _SafeStr_5112 = (_window.findChildByName("pwd_field") as ITextFieldWindow);
            var _local_3:String = CommunicationUtils.readSOLString("environment");
            _loginButton.addEventListener("WME_CLICK", windowEventProcessor);
            _loginButton.caption = ((_local_3 == null) ? "Select environment above" : (("Initializing (" + _local_3) + ")"));
            _loginButton.disable();
            if (_SafeStr_5111 != null)
            {
                _SafeStr_5111.textBackground = true;
                _SafeStr_5111.textBackgroundColor = 0xFFFFFF;
                _SafeStr_5111.text = CommunicationUtils.readSOLString("login");
                _SafeStr_5111.focus();
                _SafeStr_5111.setSelection(_SafeStr_5111.text.length, _SafeStr_5111.text.length);
                _SafeStr_5111.addEventListener("WKE_KEY_UP", windowEventProcessor);
            };
            if (_SafeStr_5112 != null)
            {
                _SafeStr_5112.textBackground = true;
                _SafeStr_5112.textBackgroundColor = 0xFFFFFF;
                _SafeStr_5112.text = CommunicationUtils.restorePassword();
                _SafeStr_5112.addEventListener("WKE_KEY_UP", windowEventProcessor);
            };
            var _local_2:ISelectableWindow = (_window.findChildByName("useTicket") as ISelectableWindow);
            _local_2.addEventListener("WME_CLICK", windowEventProcessorCheckbox);
            if (_local_2)
            {
                _local_2.select();
            };
            var _local_1:ISelectableWindow = (_window.findChildByName("useExistingSession") as ISelectableWindow);
            if (_local_1)
            {
                _local_1.unselect();
            };
            if (_SafeStr_5113.getBoolean("try.existing.session"))
            {
                _firstTryUsingExistingSession = true;
                _window.visible = false;
                windowEventProcessor(_SafeStr_3116.allocate("WE_OK", _window, null, false));
            };
            var _local_4:IItemListWindow = (_window.findChildByName("list") as IItemListWindow);
            _SafeStr_5114 = _local_4.removeListItemAt(0);
            _SafeStr_5110 = new _SafeStr_3337((_window.findChildByName("environment_list") as _SafeStr_3284), _SafeStr_5113, _SafeStr_5108, _SafeStr_5107);
            _SafeStr_5110.addEventListener("ENVIRONMENT_SELECTED_EVENT", onEnvironmentSelected);
        }

        private function onEnvironmentSelected(_arg_1:Event=null):void
        {
            dispatchEvent(new Event("ENVIRONMENT_SELECTED"));
            _loginButton.disable();
            _loginButton.caption = (("Initializing (" + _SafeStr_5110.selectedEnvironment) + ")");
            showInfoMessage((("Initializing Web Api connection to (" + _SafeStr_5110.getEnvironmentName(_SafeStr_5110.selectedEnvironment)) + ")"));
        }

        public function populateUserList(_arg_1:_SafeStr_24):void
        {
            var _local_3:* = null;
            var _local_4:int;
            var _local_5:IItemListWindow = (_window.findChildByName("list") as IItemListWindow);
            if (!_local_5)
            {
                return;
            };
            _window.findChildByName("users_info").visible = false;
            var _local_2:_SafeStr_3109 = _SafeStr_5114.clone();
            _local_2.procedure = listEventHandler;
            _local_4 = 0;
            while (_local_4 < _arg_1.length)
            {
                _local_3 = _local_2.clone();
                _local_3.id = _arg_1.getKey(_local_4);
                _local_3.caption = _arg_1.getWithIndex(_local_4);
                _local_5.addListItem(_local_3);
                _local_4++;
            };
            _local_2.dispose();
        }

        public function displayResults(_arg_1:String):void
        {
            var _local_2:ITextWindow = (_window.findChildByName("text002") as ITextWindow);
            if (_local_2 != null)
            {
                _local_2.text = _arg_1;
            };
        }

        private function handleKeyUp(_arg_1:WindowKeyboardEvent):void
        {
            var _local_3:int;
            var _local_6:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_2:* = null;
            var _local_7:WindowKeyboardEvent = (_arg_1 as WindowKeyboardEvent);
            if (_local_7.ctrlKey)
            {
                _local_3 = (_local_7.keyCode - 49);
                if (((_local_3 >= 0) && (_local_3 < 10)))
                {
                    _local_6 = _SafeStr_5113.getProperty((("login.user." + _local_3) + ".name"));
                    _local_4 = _SafeStr_5113.getProperty((("login.user." + _local_3) + ".pass"));
                    _local_5 = (_window.findChildByName("name_field") as ITextFieldWindow);
                    _local_2 = (_window.findChildByName("pwd_field") as ITextFieldWindow);
                    if (_local_6 != "")
                    {
                        _local_5.caption = _local_6;
                    };
                    if (_local_4 != "")
                    {
                        _local_2.caption = _local_4;
                    };
                    _local_5.setSelection(_local_5.text.length, _local_5.text.length);
                    if (_local_7.cancelable)
                    {
                        _local_7.preventDefault();
                        _local_7.preventWindowOperation();
                    };
                    _arg_1.stopImmediatePropagation();
                    _arg_1.stopPropagation();
                };
            };
        }

        private function windowEventProcessor(_arg_1:_SafeStr_3116=null, _arg_2:_SafeStr_3109=null):void
        {
            if (_arg_1.type == "WKE_KEY_UP")
            {
                handleKeyUp((_arg_1 as WindowKeyboardEvent));
                if ((_arg_1 as WindowKeyboardEvent).keyCode != 13)
                {
                    return;
                };
            };
            if (_SafeStr_5111 != null)
            {
                name = _SafeStr_5111.text;
            };
            if (_SafeStr_5112 != null)
            {
                password = _SafeStr_5112.text;
            };
            CommunicationUtils.writeSOLProperty("login", name);
            CommunicationUtils.storePassword(password);
            dispatchEvent(new Event("INIT_LOGIN"));
            _loginButton.disable();
        }

        private function windowEventProcessorCheckbox(_arg_1:_SafeStr_3116=null, _arg_2:_SafeStr_3109=null):void
        {
            _loginButton.enable();
        }

        private function listEventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (useWebApi)
            {
                _SafeStr_5109 = _SafeStr_5115[_arg_2.id];
            }
            else
            {
                _SafeStr_3911 = _SafeStr_5115[_arg_2.id].id;
            };
            dispatchEvent(new Event("AVATAR_SELECTED"));
        }

        public function showError(_arg_1:int, _arg_2:int, _arg_3:String):void
        {
            _window.findChildByName("users_info").caption = ((("Received error: " + _arg_1) + " regarding message: ") + _arg_2);
        }

        private function showErrorMessage(_arg_1:String):void
        {
            _window.findChildByName("users_info").caption = ("Error:\n\n" + _arg_1);
        }

        private function showInfoMessage(_arg_1:String):void
        {
            _window.findChildByName("users_info").caption = _arg_1;
        }

        public function showLoginScreen():void
        {
        }

        public function showRegistrationError(_arg_1:Object):void
        {
            showErrorMessage("Registration error");
        }

        public function showInvalidLoginError(_arg_1:Object):void
        {
            showErrorMessage("Invalid login");
        }

        public function nameCheckResponse(_arg_1:Object, _arg_2:Boolean):void
        {
        }

        public function showCaptchaError():void
        {
            showErrorMessage("Captcha required, please add your IP to Housekeeping property to avoid this.");
        }

        public function showAccountError(_arg_1:Object):void
        {
            showErrorMessage("Error with account during login");
        }

        public function showLoadingScreen():void
        {
            dispose();
        }

        public function saveLooksError(_arg_1:Object):void
        {
            showErrorMessage("Save looks error ");
        }

        public function showTOS():void
        {
            showErrorMessage("Web-api wants to show Terms of Service");
        }

        public function environmentReady():void
        {
            _loginButton.enable();
            _loginButton.caption = (("Login (" + _SafeStr_5110.selectedEnvironment) + ")");
            showInfoMessage((("Web Api connection is established for (" + _SafeStr_5110.getEnvironmentName(_SafeStr_5110.selectedEnvironment)) + "). Ready to connect."));
        }

        public function populateCharacterList(_arg_1:Vector.<AvatarData>):void
        {
            var _local_3:* = null;
            _SafeStr_5115 = _arg_1;
            var _local_6:String = CommunicationUtils.readSOLString("useruniqueid");
            var _local_2:_SafeStr_24 = new _SafeStr_24();
            var _local_4:int;
            for each (var _local_5:AvatarData in _arg_1)
            {
                if (_local_5.uniqueId == _local_6)
                {
                    _local_3 = _local_5;
                };
                _local_2[_local_4] = _local_5.name;
                _local_4++;
            };
            populateUserList(_local_2);
        }

        public function showSelectAvatar(_arg_1:Object):void
        {
        }

        public function showPromoHabbos(_arg_1:XML):void
        {
        }

        public function showSelectRoom():void
        {
        }

        public function showDisconnectedWithText(_arg_1:int):void
        {
            showErrorMessage("Hotel is closed");
        }

        public function showDisconnected(_arg_1:int, _arg_2:String):void
        {
            showErrorMessage((((("Disconnected reason: " + _arg_2) + " (") + _arg_1) + ")"));
        }

        public function getProperty(_arg_1:String, _arg_2:Dictionary=null):String
        {
            return ((_SafeStr_5113) ? _SafeStr_5113.getProperty(_arg_1, _arg_2) : "");
        }

        public function createCaptchaView():_SafeStr_34
        {
            return (undefined);
        }

        public function captchaReady():void
        {
        }


    }
}//package com.sulake.habbo.communication.demo

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3233 = "_-jf" (String#13267, DoABC#4)
// _SafeStr_3284 = "_-21F" (String#5819, DoABC#4)
// _SafeStr_3337 = "_-u1Z" (String#11595, DoABC#4)
// _SafeStr_34 = "_-41Q" (String#34875, DoABC#4)
// _SafeStr_3911 = "_-mj" (String#4093, DoABC#4)
// _SafeStr_4003 = "_-Qd" (String#802, DoABC#4)
// _SafeStr_5107 = "_-j1u" (String#8231, DoABC#4)
// _SafeStr_5108 = "_-LQ" (String#14631, DoABC#4)
// _SafeStr_5109 = "_-Vd" (String#19204, DoABC#4)
// _SafeStr_5110 = "_-QM" (String#4631, DoABC#4)
// _SafeStr_5111 = "_-z1q" (String#5474, DoABC#4)
// _SafeStr_5112 = "_-M1o" (String#7065, DoABC#4)
// _SafeStr_5113 = "_-P1g" (String#4552, DoABC#4)
// _SafeStr_5114 = "_-2i" (String#22315, DoABC#4)
// _SafeStr_5115 = "_-fH" (String#14353, DoABC#4)
// _SafeStr_8367 = "_-51Y" (String#15525, DoABC#4)


