﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-T7._SafeStr_196

package _-T7
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_196 implements IMessageComposer, _SafeStr_13 
    {

        public static const _SafeStr_7039:int = -1;

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
}//package _-T7

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_196 = "_-G4" (String#7616, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_7039 = "_-s1z" (String#10207, DoABC#3)


