// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-p1Y._SafeStr_328

package _-p1Y
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_328 implements IMessageComposer 
    {

        private var _SafeStr_4132:Array;

        public function _SafeStr_328(_arg_1:String, _arg_2:Boolean)
        {
            _SafeStr_4132 = [_arg_1, _arg_2];
        }

        public function dispose():void
        {
            _SafeStr_4132 = null;
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_4132);
        }


    }
}//package _-p1Y

// _SafeStr_328 = "_-Ef" (String#7514, DoABC#3)
// _SafeStr_4132 = "_-s1S" (String#10186, DoABC#3)


