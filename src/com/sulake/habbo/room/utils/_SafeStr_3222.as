// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.utils._SafeStr_3222

package com.sulake.habbo.room.utils
{
    import com.sulake.room.object.IRoomObjectController;

    [SecureSWF(rename="true")]
    public class _SafeStr_3222 
    {

        private var _SafeStr_3984:IRoomObjectController;
        private var _SafeStr_4936:Boolean;

        public function _SafeStr_3222(_arg_1:IRoomObjectController, _arg_2:Boolean)
        {
            _SafeStr_3984 = _arg_1;
            _SafeStr_4936 = _arg_2;
        }

        public function get object():IRoomObjectController
        {
            return (_SafeStr_3984);
        }

        public function get groupBadge():Boolean
        {
            return (_SafeStr_4936);
        }


    }
}//package com.sulake.habbo.room.utils

// _SafeStr_3222 = "_-UQ" (String#12398, DoABC#4)
// _SafeStr_3984 = "_-Ej" (String#1774, DoABC#4)
// _SafeStr_4936 = "_-nO" (String#8969, DoABC#4)


