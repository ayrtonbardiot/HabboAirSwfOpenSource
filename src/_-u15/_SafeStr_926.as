// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-u15._SafeStr_926

package _-u15
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_926 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_926(_arg_1:int)
        {
            _SafeStr_3740.push(_arg_1);
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
}//package _-u15

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_926 = "_-Zd" (String#8946, DoABC#3)


