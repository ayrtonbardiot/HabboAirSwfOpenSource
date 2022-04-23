// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-51c._SafeStr_951

package _-51c
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_951 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];


        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }

        public function dispose():void
        {
            _SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_6600 == null);
        }


    }
}//package _-51c

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_951 = "_-j1v" (String#9612, DoABC#3)


