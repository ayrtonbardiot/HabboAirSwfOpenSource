// by nota

//com.sulake.habbo.inventory.badges.Badge

package com.sulake.habbo.inventory.badges
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.core.window.events._SafeStr_3116;

    public class Badge 
    {

        private static const THUMB_COLOR_NORMAL:int = 0xCCCCCC;
        private static const THUMB_COLOR_UNSEEN:int = 10275685;

        public static var _SafeStr_4618:_SafeStr_3133;

        private var _SafeStr_3883:Boolean = false;
        private var _SafeStr_4615:String;
        private var _SafeStr_4616:Boolean;
        private var _SafeStr_4617:Boolean;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4620:_SafeStr_3109;
        private var _isUnseen:Boolean;
        private var _name:String;
        private var _desc:String;
        private var _SafeStr_4619:BadgesModel;

        public function Badge(_arg_1:BadgesModel, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:Boolean)
        {
            _SafeStr_4619 = _arg_1;
            _SafeStr_4615 = _arg_2;
            _name = _arg_3;
            _desc = _arg_4;
            _isUnseen = _arg_5;
            this.isSelected = false;
        }

        public function dispose():void
        {
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function get badgeId():String
        {
            return (_SafeStr_4615);
        }

        public function get badgeName():String
        {
            return (_name);
        }

        public function get badgeDescription():String
        {
            return (_desc);
        }

        public function get isInUse():Boolean
        {
            return (_SafeStr_4616);
        }

        public function get isSelected():Boolean
        {
            return (_SafeStr_4617);
        }

        public function get window():_SafeStr_3133
        {
            if (!_SafeStr_3883)
            {
                initWindow();
            };
            return (_window);
        }

        private function initWindow():void
        {
            _window = (_SafeStr_4618.clone() as _SafeStr_3133);
            _SafeStr_3349(_SafeStr_3199(_window.findChildByName("badge")).widget).badgeId = badgeId;
            _window.findChildByName("badge").visible = true;
            _SafeStr_4620 = _window.findChildByTag("BG_COLOR");
            _SafeStr_3883 = true;
            _window.procedure = itemEventProc;
        }

        private function itemEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            switch (_arg_1.type)
            {
                case "WME_CLICK":
                    _SafeStr_4619.setBadgeSelected(this.badgeId);
                    return;
            };
        }

        public function set isInUse(_arg_1:Boolean):void
        {
            _SafeStr_4616 = _arg_1;
        }

        public function set isSelected(_arg_1:Boolean):void
        {
            _SafeStr_4617 = _arg_1;
            if (((_SafeStr_4620 == null) || (_window == null)))
            {
                return;
            };
            _SafeStr_4620.color = ((_isUnseen) ? 10275685 : 0xCCCCCC);
            _window.findChildByName("outline").visible = _arg_1;
        }

        public function set isUnseen(_arg_1:Boolean):void
        {
            if (_isUnseen != _arg_1)
            {
                _isUnseen = _arg_1;
                this.isSelected = _SafeStr_4617;
            };
        }


    }
}//package com.sulake.habbo.inventory.badges

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_4615 = "_-91W" (String#2170, DoABC#4)
// _SafeStr_4616 = "_-L1v" (String#7703, DoABC#4)
// _SafeStr_4617 = "_-229" (String#2305, DoABC#4)
// _SafeStr_4618 = "_-X1U" (String#11425, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_4620 = "_-1k" (String#1879, DoABC#4)


