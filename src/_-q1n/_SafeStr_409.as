// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-q1n._SafeStr_409

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_409 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_409(_arg_1:String)
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
}//package _-q1n

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_409 = "_-Oc" (String#8183, DoABC#3)


