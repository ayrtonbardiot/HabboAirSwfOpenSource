// by nota

//com.sulake.habbo.help.namechange.NameChangeController

package com.sulake.habbo.help.namechange
{
    import com.sulake.habbo.help.INameChangeUI;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.help.HabboHelp;
    import _-yL._SafeStr_528;
    import _-W1K._SafeStr_206;
    import _-a1N._SafeStr_331;
    import _-a1N._SafeStr_685;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
    import _-s3._SafeStr_375;
    import _-s3._SafeStr_237;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import _-MB._SafeStr_1090;
    import _-MB._SafeStr_1092;
    import _-K1r._SafeStr_1185;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1212;

    public class NameChangeController implements INameChangeUI, _SafeStr_13 
    {

        public static const NAME_CHANGE:String = "TUI_NAME_VIEW";

        private var _disposed:Boolean;
        private var _habboHelp:HabboHelp;
        private var _SafeStr_4864:NameChangeView;
        private var _ownUserName:String;
        private var _SafeStr_4115:int;

        public function NameChangeController(_arg_1:HabboHelp)
        {
            _habboHelp = _arg_1;
            _habboHelp.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_528(onUserObject));
            _habboHelp.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_206(onUserNameChange));
            _habboHelp.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_331(onChangeUserNameResult));
            _habboHelp.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_685(onCheckUserNameResult));
        }

        public function get help():HabboHelp
        {
            return (_habboHelp);
        }

        public function get assets():IAssetLibrary
        {
            return (_habboHelp.assets);
        }

        public function get localization():_SafeStr_18
        {
            return (_habboHelp.localization);
        }

        public function get myName():String
        {
            return (_ownUserName);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                disposeView();
                if (_habboHelp)
                {
                    _habboHelp = null;
                };
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function showView():void
        {
            if (((_SafeStr_4864 == null) || (_SafeStr_4864.disposed)))
            {
                _SafeStr_4864 = new NameChangeView(this);
            };
            _SafeStr_4864.showMainView();
            prepareForTutorial();
        }

        public function buildXmlWindow(_arg_1:String, _arg_2:uint=1):_SafeStr_3109
        {
            if (_habboHelp.assets == null)
            {
                return (null);
            };
            var _local_3:XmlAsset = XmlAsset(_habboHelp.assets.getAssetByName((_arg_1 + "_xml")));
            if (((_local_3 == null) || (_habboHelp.windowManager == null)))
            {
                return (null);
            };
            return (_habboHelp.windowManager.buildFromXML(XML(_local_3.content), _arg_2));
        }

        private function disposeWindow(_arg_1:_SafeStr_3116=null):void
        {
        }

        public function disposeView():void
        {
            if (_SafeStr_4864 != null)
            {
                _SafeStr_4864.dispose();
                _SafeStr_4864 = null;
            };
            disposeWindow();
        }

        public function hideView():void
        {
            if (_SafeStr_4864 != null)
            {
                _SafeStr_4864.dispose();
                _SafeStr_4864 = null;
            };
        }

        public function setRoomSessionStatus(_arg_1:Boolean):void
        {
            if (_arg_1 == false)
            {
                disposeView();
            };
        }

        public function prepareForTutorial():void
        {
            if (((_habboHelp == null) || (_habboHelp.events == null)))
            {
                return;
            };
            _habboHelp.events.dispatchEvent(new HabboHelpTutorialEvent("HHTPNUFWE_AVATAR_TUTORIAL_START"));
        }

        public function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            switch (_arg_1.type)
            {
                case "WME_CLICK":
                    if (_arg_2.name == "header_button_close")
                    {
                        disposeView();
                    };
                    return;
            };
        }

        public function changeName(_arg_1:String):void
        {
            disposeWindow();
            _habboHelp.sendMessage(new _SafeStr_375(_arg_1));
        }

        public function checkName(_arg_1:String):void
        {
            disposeWindow();
            _habboHelp.sendMessage(new _SafeStr_237(_arg_1));
        }

        public function onUserNameChanged(_arg_1:String):void
        {
            var name = _arg_1;
            if ((((!(_habboHelp)) || (!(_habboHelp.localization))) || (!(_habboHelp.windowManager))))
            {
                return;
            };
            _habboHelp.localization.registerParameter("help.tutorial.name.changed", "name", name);
            _habboHelp.windowManager.alert("${generic.notice}", "${help.tutorial.name.changed}", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
            {
                _arg_1.dispose();
            });
        }

        private function onChangeUserNameResult(_arg_1:_SafeStr_331):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1090 = _arg_1.getParser();
            if (_local_2 == null)
            {
                return;
            };
            if (_local_2.resultCode == _SafeStr_331._SafeStr_3821)
            {
                onUserNameChanged(_local_2.name);
                hideView();
            }
            else
            {
                if (_SafeStr_4864)
                {
                    _SafeStr_4864.setNameNotAvailableView(_local_2.resultCode, _local_2.name, _local_2.nameSuggestions);
                };
            };
        }

        private function onCheckUserNameResult(_arg_1:_SafeStr_685):void
        {
            if (((!(_arg_1)) || (!(_SafeStr_4864))))
            {
                return;
            };
            var _local_2:_SafeStr_1092 = _arg_1.getParser();
            if (_local_2.resultCode == _SafeStr_331._SafeStr_3821)
            {
                _SafeStr_4864.checkedName = _local_2.name;
            }
            else
            {
                _SafeStr_4864.setNameNotAvailableView(_local_2.resultCode, _local_2.name, _local_2.nameSuggestions);
            };
        }

        private function onUserObject(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1185 = _SafeStr_528(_arg_1).getParser();
            _SafeStr_4115 = _local_2.id;
            _ownUserName = _local_2.name;
        }

        private function onUserNameChange(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1212 = _SafeStr_206(_arg_1).getParser();
            if (_SafeStr_4115 == _local_2.webId)
            {
                _ownUserName = _local_2.newName;
            };
        }

        public function get ownUserName():String
        {
            return (_ownUserName);
        }

        public function get ownUserId():int
        {
            return (_SafeStr_4115);
        }


    }
}//package com.sulake.habbo.help.namechange

// _SafeStr_1090 = "_-Z1H" (String#31344, DoABC#4)
// _SafeStr_1092 = "_-Y4" (String#28998, DoABC#4)
// _SafeStr_1185 = "_-Fb" (String#8393, DoABC#4)
// _SafeStr_1212 = "_-i1F" (String#23205, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_206 = "_-tP" (String#6892, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_237 = "_-fW" (String#19059, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_331 = "_-z8" (String#2976, DoABC#4)
// _SafeStr_375 = "_-Yd" (String#30976, DoABC#4)
// _SafeStr_3821 = "_-5N" (String#22387, DoABC#4)
// _SafeStr_4115 = "_-B1l" (String#5568, DoABC#4)
// _SafeStr_4864 = "_-KK" (String#4088, DoABC#4)
// _SafeStr_528 = "_-MO" (String#2024, DoABC#4)
// _SafeStr_685 = "_-U1q" (String#13587, DoABC#4)


