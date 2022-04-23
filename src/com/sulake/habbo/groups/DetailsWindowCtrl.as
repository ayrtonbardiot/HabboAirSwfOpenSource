// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.groups.DetailsWindowCtrl

package com.sulake.habbo.groups
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3133;
    import _-W1K._SafeStr_1123;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class DetailsWindowCtrl implements _SafeStr_13 
    {

        private var _SafeStr_4144:HabboGroupsManager;
        private var _window:_SafeStr_3263;
        private var _SafeStr_4650:GroupDetailsCtrl;
        private var _groupId:int;

        public function DetailsWindowCtrl(_arg_1:HabboGroupsManager)
        {
            _SafeStr_4144 = _arg_1;
            _SafeStr_4650 = new GroupDetailsCtrl(_arg_1, true);
        }

        public function dispose():void
        {
            _SafeStr_4144 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_4650)
            {
                _SafeStr_4650.dispose();
                _SafeStr_4650 = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4144 == null);
        }

        public function isDisplayingGroup(_arg_1:int):Boolean
        {
            return (((!(_window == null)) && (_window.visible)) && (_arg_1 == _groupId));
        }

        public function onGroupDetails(_arg_1:_SafeStr_1123):void
        {
            if (((((!(_window == null)) && (_window.visible)) && (_arg_1.groupId == _groupId)) || (_arg_1.openDetails)))
            {
                _groupId = _arg_1.groupId;
                prepareWindow();
                _SafeStr_4650.onGroupDetails(_SafeStr_3133(_window.findChildByName("group_cont")), _arg_1);
                if (_arg_1.openDetails)
                {
                    _window.visible = true;
                    _window.activate();
                };
            };
        }

        private function prepareWindow():void
        {
            if (_window != null)
            {
                return;
            };
            _window = _SafeStr_3263(_SafeStr_4144.getXmlWindow("group_info_window"));
            _window.findChildByTag("close").procedure = onClose;
            _window.center();
        }

        private function onClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            close();
        }

        public function close():void
        {
            if (_window != null)
            {
                _groupId = 0;
                _window.visible = false;
            };
        }

        public function onGroupDeactivated(_arg_1:int):void
        {
            if (_groupId == _arg_1)
            {
                close();
            };
        }


    }
}//package com.sulake.habbo.groups

// _SafeStr_1123 = "_-r1M" (String#6272, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_4650 = "_-u1K" (String#4879, DoABC#4)


