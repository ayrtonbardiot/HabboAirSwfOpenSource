// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.help.namechange.NameChangeView

package com.sulake.habbo.help.namechange
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.help.INameChangeUI;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components.ITextWindow;
    import flash.external.ExternalInterface;
    import com.sulake.core.window.components.ITextFieldWindow;
    import _-a1N._SafeStr_331;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class NameChangeView implements _SafeStr_13 
    {

        private static const NAME_UPDATE_FUNCTION:String = "FlashExternalInterface.updateName";

        private static var NAME_SUGGESTION_BG_COLOR:uint = 13232628;
        private static var NAME_SUGGESTION_BG_COLOR_OVER:uint = 11129827;

        private var _SafeStr_4360:INameChangeUI;
        private var _window:_SafeStr_3263;
        private var _checkedName:String;
        private var _pendingName:String;
        private var _SafeStr_3761:_SafeStr_3133;
        private var _SafeStr_6123:_SafeStr_3133;
        private var _SafeStr_6124:_SafeStr_3133;
        private var _SafeStr_4494:_SafeStr_3133;
        private var _SafeStr_6132:Boolean = false;
        private var _SafeStr_6122:NameSuggestionListRenderer;
        private var _disposed:Boolean;

        public function NameChangeView(_arg_1:INameChangeUI):void
        {
            _SafeStr_4360 = _arg_1;
        }

        public function get id():String
        {
            return ("TUI_NAME_VIEW");
        }

        public function set checkedName(_arg_1:String):void
        {
            _checkedName = _arg_1;
            if (_pendingName == _checkedName)
            {
                showConfirmationView();
                return;
            };
            setNameAvailableView();
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                disposeWindow();
                if (_SafeStr_6122 != null)
                {
                    _SafeStr_6122.dispose();
                    _SafeStr_6122 = null;
                };
                _disposed = true;
            };
        }

        private function disposeWindow():void
        {
            _SafeStr_3761 = null;
            _SafeStr_6123 = null;
            _SafeStr_6124 = null;
            _SafeStr_4494 = null;
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function showView(_arg_1:_SafeStr_3133):void
        {
            _SafeStr_6132 = false;
            if (_SafeStr_4494)
            {
                _SafeStr_4494.visible = false;
            };
            _SafeStr_4494 = _arg_1;
            _SafeStr_4494.visible = true;
            if (_window)
            {
                _window.content.width = _SafeStr_4494.width;
                _window.content.height = _SafeStr_4494.height;
            };
        }

        public function showMainView():void
        {
            if (!_window)
            {
                _window = (_SafeStr_4360.buildXmlWindow("welcome_name_change") as _SafeStr_3263);
                _window.center();
                _window.procedure = windowEventHandler;
                _SafeStr_3761 = (_window.content.getChildAt(0) as _SafeStr_3133);
            };
            _SafeStr_4360.localization.registerParameter("tutorial.name_change.current", "name", _SafeStr_4360.myName);
            _window.caption = _SafeStr_4360.localization.getLocalization("tutorial.name_change.title.main");
            showView(_SafeStr_3761);
        }

        private function showSelectionView():void
        {
            if (!_SafeStr_6123)
            {
                _SafeStr_6123 = (_SafeStr_4360.buildXmlWindow("welcome_name_selection") as _SafeStr_3133);
                if (!_SafeStr_6123)
                {
                    return;
                };
                _window.content.addChild(_SafeStr_6123);
            };
            _window.caption = _SafeStr_4360.localization.getLocalization("tutorial.name_change.title.select");
            var _local_1:_SafeStr_3122 = (_window.findChildByName("select_name_button") as _SafeStr_3122);
            if (_local_1)
            {
                _local_1.disable();
            };
            setNormalView();
            showView(_SafeStr_6123);
        }

        private function showConfirmationView():void
        {
            if (!_SafeStr_6124)
            {
                _SafeStr_6124 = (_SafeStr_4360.buildXmlWindow("welcome_name_confirmation") as _SafeStr_3133);
                if (!_SafeStr_6124)
                {
                    return;
                };
                _window.content.addChild(_SafeStr_6124);
            };
            _window.caption = _SafeStr_4360.localization.getLocalization("tutorial.name_change.title.confirm");
            var _local_1:ITextWindow = (_SafeStr_6124.findChildByName("final_name") as ITextWindow);
            if (_local_1)
            {
                _local_1.text = _checkedName;
            };
            showView(_SafeStr_6124);
            if (ExternalInterface.available)
            {
                ExternalInterface.call("FlashExternalInterface.updateName", _checkedName);
            };
        }

        public function get view():_SafeStr_3133
        {
            return (_window);
        }

        public function setNormalView():void
        {
            if (_window == null)
            {
                return;
            };
            var _local_2:ITextWindow = (_window.findChildByName("info_text") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.text = _SafeStr_4360.localization.getLocalization("help.tutorial.name.info");
            var _local_1:_SafeStr_3133 = (_window.findChildByName("suggestions") as _SafeStr_3133);
            if (_local_1 == null)
            {
                return;
            };
            _local_1.visible = false;
        }

        public function setNameAvailableView():void
        {
            if (_window == null)
            {
                return;
            };
            nameCheckWaitEnd(true);
            var _local_2:ITextWindow = (_window.findChildByName("info_text") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            };
            _SafeStr_4360.localization.registerParameter("help.tutorial.name.available", "name", _checkedName);
            _local_2.text = _SafeStr_4360.localization.getLocalization("help.tutorial.name.available");
            var _local_3:ITextFieldWindow = (_window.findChildByName("input") as ITextFieldWindow);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.text = _checkedName;
            var _local_1:_SafeStr_3133 = (_window.findChildByName("suggestions") as _SafeStr_3133);
            if (_local_1 == null)
            {
                return;
            };
            _local_1.visible = false;
        }

        public function setNameNotAvailableView(_arg_1:int, _arg_2:String, _arg_3:Array):void
        {
            var _local_8:int;
            var _local_6:* = null;
            nameCheckWaitEnd(false);
            if (_SafeStr_4494 != _SafeStr_6123)
            {
                showSelectionView();
            };
            _pendingName = null;
            _checkedName = null;
            if (_window == null)
            {
                return;
            };
            var _local_5:ITextWindow = (_window.findChildByName("info_text") as ITextWindow);
            if (_local_5 == null)
            {
                return;
            };
            switch (_arg_1)
            {
                case _SafeStr_331._SafeStr_6125:
                    _SafeStr_4360.localization.registerParameter("help.tutorial.name.taken", "name", _arg_2);
                    _local_5.text = _SafeStr_4360.localization.getLocalization("help.tutorial.name.taken");
                    break;
                case _SafeStr_331._SafeStr_6126:
                    _SafeStr_4360.localization.registerParameter("help.tutorial.name.invalid", "name", _arg_2);
                    _local_5.text = _SafeStr_4360.localization.getLocalization("help.tutorial.name.invalid");
                    break;
                case _SafeStr_331._SafeStr_6127:
                    break;
                case _SafeStr_331._SafeStr_6128:
                    _local_5.text = _SafeStr_4360.localization.getLocalization("help.tutorial.name.long");
                    break;
                case _SafeStr_331._SafeStr_6129:
                    _local_5.text = _SafeStr_4360.localization.getLocalization("help.tutorial.name.short");
                    break;
                case _SafeStr_331._SafeStr_6130:
                    _local_5.text = _SafeStr_4360.localization.getLocalization("help.tutorial.name.change_not_allowed");
                    break;
                case _SafeStr_331._SafeStr_6131:
                    _local_5.text = _SafeStr_4360.localization.getLocalization("help.tutorial.name.merge_hotel_down");
            };
            var _local_4:_SafeStr_3133 = (_window.findChildByName("suggestions") as _SafeStr_3133);
            if (_local_4 == null)
            {
                return;
            };
            if (((_arg_1 == _SafeStr_331._SafeStr_6131) || (_arg_1 == _SafeStr_331._SafeStr_6130)))
            {
                _local_4.visible = false;
                return;
            };
            _local_4.visible = true;
            _SafeStr_6122 = new NameSuggestionListRenderer(_SafeStr_4360);
            var _local_7:int = _SafeStr_6122.render(_arg_3, _local_4);
            _local_8 = 0;
            while (_local_8 < _local_4.numChildren)
            {
                _local_6 = _local_4.getChildAt(_local_8);
                _local_6.color = NAME_SUGGESTION_BG_COLOR;
                _local_6.addEventListener("WME_CLICK", nameSelected);
                _local_6.addEventListener("WME_OVER", nameOver);
                _local_6.addEventListener("WME_OUT", nameOut);
                _local_8++;
            };
        }

        private function nameSelected(_arg_1:WindowMouseEvent):void
        {
            nameCheckWaitEnd(true);
            var _local_4:ITextWindow = (_arg_1.target as ITextWindow);
            if (!_local_4)
            {
                return;
            };
            var _local_3:String = _local_4.text;
            setNormalView();
            var _local_2:ITextFieldWindow = (_window.findChildByName("input") as ITextFieldWindow);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.text = _local_3;
        }

        private function nameOver(_arg_1:WindowMouseEvent):void
        {
            var _local_2:ITextWindow = (_arg_1.target as ITextWindow);
            if (_local_2 != null)
            {
                _local_2.color = NAME_SUGGESTION_BG_COLOR_OVER;
            };
        }

        private function nameOut(_arg_1:WindowMouseEvent):void
        {
            var _local_2:ITextWindow = (_arg_1.target as ITextWindow);
            if (_local_2 != null)
            {
                _local_2.color = NAME_SUGGESTION_BG_COLOR;
            };
        }

        public function nameCheckWaitBegin():void
        {
            var _local_1:* = null;
            if (((_window) && (!(_window.disposed))))
            {
                _local_1 = _window.findChildByName("select_name_button");
                if (_local_1)
                {
                    _local_1.disable();
                };
                _local_1 = _window.findChildByName("check_name_button");
                if (_local_1)
                {
                    _local_1.disable();
                };
                _local_1 = _window.findChildByName("input");
                if (_local_1)
                {
                    _local_1.disable();
                };
                _local_1 = _window.findChildByName("info_text");
                if (_local_1)
                {
                    _local_1.caption = _SafeStr_4360.localization.getLocalization("help.tutorial.name.wait_while_checking");
                };
            };
            _SafeStr_6132 = true;
        }

        public function nameCheckWaitEnd(_arg_1:Boolean):void
        {
            var _local_2:* = null;
            if (((_window) && (!(_window.disposed))))
            {
                if (_arg_1)
                {
                    _local_2 = _window.findChildByName("select_name_button");
                    if (_local_2)
                    {
                        _local_2.enable();
                    };
                };
                _local_2 = _window.findChildByName("check_name_button");
                if (_local_2)
                {
                    _local_2.enable();
                };
                _local_2 = _window.findChildByName("input");
                if (_local_2)
                {
                    _local_2.enable();
                };
            };
            _SafeStr_6132 = false;
        }

        private function windowEventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            if (!_SafeStr_6132)
            {
                if (_arg_1.type == "WE_CHANGE")
                {
                    if (_arg_2.name == "input")
                    {
                        _local_3 = _window.findChildByName("select_name_button");
                        _local_4 = (_arg_2 as ITextFieldWindow);
                        if (((_local_3) && (_local_4)))
                        {
                            if (_local_4.text.length > 2)
                            {
                                _local_3.enable();
                            }
                            else
                            {
                                _local_3.disable();
                            };
                        };
                    };
                };
            };
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "change_name_button":
                    showSelectionView();
                    return;
                case "keep_name_button":
                    _checkedName = _SafeStr_4360.myName;
                    showConfirmationView();
                    return;
                case "check_name_button":
                    _SafeStr_4360.checkName(getName());
                    nameCheckWaitBegin();
                    return;
                case "select_name_button":
                    _local_5 = getName();
                    if (_local_5.length < 1)
                    {
                        return;
                    };
                    if (_checkedName != _local_5)
                    {
                        _pendingName = _local_5;
                        _SafeStr_4360.checkName(_local_5);
                        nameCheckWaitBegin();
                    }
                    else
                    {
                        showConfirmationView();
                    };
                    return;
                case "cancel_selection_button":
                    _SafeStr_4360.hideView();
                    return;
                case "confirm_name_button":
                    _SafeStr_4360.changeName(_checkedName);
                    return;
                case "cancel_confirmation_button":
                    _SafeStr_4360.hideView();
                    return;
                case "header_button_close":
                    _SafeStr_4360.hideView();
                    return;
            };
        }

        private function getName():String
        {
            var _local_1:* = null;
            if (_window)
            {
                _local_1 = (_window.findChildByName("input") as ITextFieldWindow);
                if (_local_1)
                {
                    return (_local_1.text);
                };
            };
            return (null);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }


    }
}//package com.sulake.habbo.help.namechange

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_331 = "_-z8" (String#2976, DoABC#4)
// _SafeStr_3761 = "_-11L" (String#982, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4494 = "_-LI" (String#1588, DoABC#4)
// _SafeStr_6122 = "_-vg" (String#6353, DoABC#4)
// _SafeStr_6123 = "_-wF" (String#7562, DoABC#4)
// _SafeStr_6124 = "_-R1x" (String#7462, DoABC#4)
// _SafeStr_6125 = "_-01A" (String#28564, DoABC#4)
// _SafeStr_6126 = "_-x1W" (String#29988, DoABC#4)
// _SafeStr_6127 = "_-tt" (String#30610, DoABC#4)
// _SafeStr_6128 = "_-cG" (String#29776, DoABC#4)
// _SafeStr_6129 = "_-Tq" (String#29585, DoABC#4)
// _SafeStr_6130 = "_-o1y" (String#21038, DoABC#4)
// _SafeStr_6131 = "_-4Y" (String#22198, DoABC#4)
// _SafeStr_6132 = "_-6O" (String#5392, DoABC#4)


