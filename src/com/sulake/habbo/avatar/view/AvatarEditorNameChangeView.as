// by nota

//com.sulake.habbo.avatar.view.AvatarEditorNameChangeView

package com.sulake.habbo.avatar.view
{
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.avatar.AvatarEditorView;
    import com.sulake.habbo.avatar.HabboAvatarEditorManager;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window._SafeStr_3133;
    import _-a1N._SafeStr_331;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class AvatarEditorNameChangeView 
    {

        private static var NAME_SUGGESTION_BG_COLOR:uint = 13232628;
        private static var NAME_SUGGESTION_BG_COLOR_OVER:uint = 11129827;

        private var _window:_SafeStr_3263;
        private var _SafeStr_3761:AvatarEditorView;
        private var _SafeStr_4144:HabboAvatarEditorManager;
        private var _SafeStr_6122:AvatarEditorNameSuggestionListRenderer;
        private var _checkedName:String;
        private var _pendingName:String;
        private var _SafeStr_6132:Boolean = false;

        public function AvatarEditorNameChangeView(_arg_1:AvatarEditorView, _arg_2:int, _arg_3:int)
        {
            _SafeStr_3761 = _arg_1;
            _SafeStr_4144 = _SafeStr_3761.editor.manager;
            _window = _SafeStr_3263(_SafeStr_4144.windowManager.buildFromXML(XML(new HabboAvatarEditorCom.avatar_editor_name_change())));
            _window.x = _arg_2;
            var _local_4:int = _SafeStr_4144.windowManager.getDesktop(1).width;
            if ((_window.x + _window.width) > _local_4)
            {
                _window.x = (_local_4 - _window.width);
            };
            _window.y = _arg_3;
            initControls();
        }

        private function initControls():void
        {
            _window.procedure = windowEventHandler;
            var _local_1:_SafeStr_3122 = (_window.findChildByName("select_name_button") as _SafeStr_3122);
            if (_local_1)
            {
                _local_1.disable();
            };
        }

        public function focus():void
        {
            _window.activate();
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
                    _local_1.caption = _SafeStr_4144.localization.getLocalization("help.tutorial.name.wait_while_checking");
                };
            };
            _SafeStr_6132 = true;
        }

        private function windowEventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
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
                case "check_name_button":
                    _SafeStr_4144.handler.checkName(getName());
                    nameCheckWaitBegin();
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

        public function set checkedName(_arg_1:String):void
        {
            _checkedName = _arg_1;
            if (_pendingName == _checkedName)
            {
                return;
            };
            setNameAvailableView();
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
            _SafeStr_4144.localization.registerParameter("help.tutorial.name.available", "name", _checkedName);
            _local_2.text = _SafeStr_4144.localization.getLocalization("help.tutorial.name.available");
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
                    _SafeStr_4144.localization.registerParameter("help.tutorial.name.taken", "name", _arg_2);
                    _local_5.text = _SafeStr_4144.localization.getLocalization("help.tutorial.name.taken");
                    break;
                case _SafeStr_331._SafeStr_6126:
                    _SafeStr_4144.localization.registerParameter("help.tutorial.name.invalid", "name", _arg_2);
                    _local_5.text = _SafeStr_4144.localization.getLocalization("help.tutorial.name.invalid");
                    break;
                case _SafeStr_331._SafeStr_6127:
                    break;
                case _SafeStr_331._SafeStr_6128:
                    _local_5.text = _SafeStr_4144.localization.getLocalization("help.tutorial.name.long");
                    break;
                case _SafeStr_331._SafeStr_6129:
                    _local_5.text = _SafeStr_4144.localization.getLocalization("help.tutorial.name.short");
                    break;
                case _SafeStr_331._SafeStr_6130:
                    _local_5.text = _SafeStr_4144.localization.getLocalization("help.tutorial.name.change_not_allowed");
                    break;
                case _SafeStr_331._SafeStr_6131:
                    _local_5.text = _SafeStr_4144.localization.getLocalization("help.tutorial.name.merge_hotel_down");
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
            _SafeStr_6122 = new AvatarEditorNameSuggestionListRenderer(_SafeStr_4144);
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
            _local_2.text = _SafeStr_4144.localization.getLocalization("help.tutorial.name.info");
            var _local_1:_SafeStr_3133 = (_window.findChildByName("suggestions") as _SafeStr_3133);
            if (_local_1 == null)
            {
                return;
            };
            _local_1.visible = false;
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


    }
}//package com.sulake.habbo.avatar.view

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_331 = "_-z8" (String#2976, DoABC#4)
// _SafeStr_3761 = "_-11L" (String#982, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_6122 = "_-vg" (String#6353, DoABC#4)
// _SafeStr_6125 = "_-01A" (String#28564, DoABC#4)
// _SafeStr_6126 = "_-x1W" (String#29988, DoABC#4)
// _SafeStr_6127 = "_-tt" (String#30610, DoABC#4)
// _SafeStr_6128 = "_-cG" (String#29776, DoABC#4)
// _SafeStr_6129 = "_-Tq" (String#29585, DoABC#4)
// _SafeStr_6130 = "_-o1y" (String#21038, DoABC#4)
// _SafeStr_6131 = "_-4Y" (String#22198, DoABC#4)
// _SafeStr_6132 = "_-6O" (String#5392, DoABC#4)


