// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendlist.domain.FriendRequest

package com.sulake.habbo.friendlist.domain
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import _-JS._SafeStr_1649;

    public class FriendRequest implements _SafeStr_13 
    {

        public static const STATE_OPEN:int = 1;
        public static const STATE_ACCEPTED:int = 2;
        public static const STATE_DECLINED:int = 3;
        public static const STATE_FAILED:int = 4;

        private var _SafeStr_4313:int;
        private var _requesterName:String;
        private var _SafeStr_4625:int;
        private var _SafeStr_3734:int = 1;
        private var _disposed:Boolean;
        private var _SafeStr_3882:_SafeStr_3133;

        public function FriendRequest(_arg_1:_SafeStr_1649)
        {
            _SafeStr_4313 = _arg_1.requestId;
            _requesterName = _arg_1.requesterName;
            _SafeStr_4625 = _arg_1.requesterUserId;
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            if (view != null)
            {
                view.destroy();
                view = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get requestId():int
        {
            return (_SafeStr_4313);
        }

        public function get requesterName():String
        {
            return (_requesterName);
        }

        public function get requesterUserId():int
        {
            return (_SafeStr_4625);
        }

        public function get view():_SafeStr_3133
        {
            return (_SafeStr_3882);
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function set view(_arg_1:_SafeStr_3133):void
        {
            _SafeStr_3882 = _arg_1;
        }

        public function set state(_arg_1:int):void
        {
            _SafeStr_3734 = _arg_1;
        }


    }
}//package com.sulake.habbo.friendlist.domain

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1649 = "_-v1E" (String#15412, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4313 = "_-B7" (String#2703, DoABC#4)
// _SafeStr_4625 = "_-Z5" (String#19319, DoABC#4)


