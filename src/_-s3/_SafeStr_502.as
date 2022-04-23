// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-s3._SafeStr_502

package _-s3
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_502 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_502(_arg_1:int, _arg_2:String, _arg_3:String)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
            _SafeStr_3740.push(_arg_3);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }


    }
}//package _-s3

// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_502 = "_-11v" (String#6558, DoABC#3)


