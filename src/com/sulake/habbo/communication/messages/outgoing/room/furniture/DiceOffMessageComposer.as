// by nota

package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class DiceOffMessageComposer implements IMessageComposer 
    {

        private var _SafeStr_4157:int;

        public function DiceOffMessageComposer(_arg_1:int)
        {
            _SafeStr_4157 = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4157]);
        }


    }
}//package _-02a

// _SafeStr_384 = "_-l1K" (String#9742, DoABC#3)
// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)


