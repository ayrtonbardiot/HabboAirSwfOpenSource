﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-IS._SafeStr_758

package _-IS
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_758 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];


        public function getMessageArray():Array
        {
            return (this._SafeStr_6600);
        }

        public function dispose():void
        {
            this._SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-IS

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_758 = "_-I1Y" (String#7728, DoABC#3)

