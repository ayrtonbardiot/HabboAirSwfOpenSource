﻿// by nota

//_-XO._SafeStr_850

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_850 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_850(_arg_1:int, _arg_2:int, _arg_3:int)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
            _SafeStr_3740.push(_arg_3);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }


    }
}//package _-XO

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_850 = "_-3J" (String#6768, DoABC#3)


