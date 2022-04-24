// by nota

//_-02a._SafeStr_503

package com.sulake.habbo.communication.messages.outgoing.
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class AddSpamWallPostItMessageComposer implements IMessageComposer 
    {

        private var _SafeStr_7007:int;
        private var _location:String;
        private var _SafeStr_4132:String;
        private var _SafeStr_4653:String;

        public function AddSpamWallPostItMessageComposer(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:String)
        {
            _SafeStr_7007 = _arg_1;
            _location = _arg_2;
            _SafeStr_4132 = _arg_4;
            _SafeStr_4653 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_7007, _location, _SafeStr_4653, _SafeStr_4132]);
        }


    }
}//package _-02a

// _SafeStr_4132 = "_-s1S" (String#10186, DoABC#3)
// _SafeStr_4653 = "_-m10" (String#9790, DoABC#3)
// _SafeStr_503 = "_-WE" (String#8735, DoABC#3)
// _SafeStr_7007 = "_-J1n" (String#7783, DoABC#3)


