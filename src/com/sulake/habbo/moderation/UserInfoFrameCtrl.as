// by nota

//com.sulake.habbo.moderation.UserInfoFrameCtrl

package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3263;
    import _-V1k._SafeStr_1616;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;

    public class UserInfoFrameCtrl implements _SafeStr_13, ITrackedWindow 
    {

        private var _main:ModerationManager;
        private var _SafeStr_4128:int;
        private var _frame:_SafeStr_3263;
        private var _disposed:Boolean;
        private var _SafeStr_6349:UserInfoCtrl;
        private var _SafeStr_5996:_SafeStr_1616;

        public function UserInfoFrameCtrl(_arg_1:ModerationManager, _arg_2:int, _arg_3:_SafeStr_1616=null)
        {
            _main = _arg_1;
            _SafeStr_4128 = _arg_2;
            _SafeStr_5996 = _arg_3;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function show():void
        {
            _frame = _SafeStr_3263(_main.getXmlWindow("user_info_frame"));
            _frame.caption = "User Info";
            var _local_1:_SafeStr_3109 = _frame.findChildByTag("close");
            _local_1.procedure = onClose;
            _SafeStr_6349 = new UserInfoCtrl(_frame, _main, _SafeStr_5996, null, true);
            _SafeStr_6349.load(_frame.content, _SafeStr_4128);
            _frame.visible = true;
        }

        public function getType():int
        {
            return (1);
        }

        public function getId():String
        {
            return ("" + _SafeStr_4128);
        }

        public function getFrame():_SafeStr_3263
        {
            return (_frame);
        }

        private function onClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            dispose();
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            if (_frame != null)
            {
                _frame.destroy();
                _frame = null;
            };
            if (_SafeStr_6349 != null)
            {
                _SafeStr_6349.dispose();
                _SafeStr_6349 = null;
            };
            _SafeStr_5996 = null;
            _main = null;
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1616 = "_-Jg" (String#2516, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_5996 = "_-Kr" (String#2988, DoABC#4)
// _SafeStr_6349 = "_-Z1N" (String#9696, DoABC#4)


