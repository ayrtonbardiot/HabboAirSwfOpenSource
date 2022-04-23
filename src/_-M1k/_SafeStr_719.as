// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-M1k._SafeStr_719

package _-M1k
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_719 implements IMessageComposer, _SafeStr_13 
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
}//package _-M1k

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_719 = "_-i7" (String#9545, DoABC#3)


