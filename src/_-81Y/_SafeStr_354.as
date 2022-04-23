// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-81Y._SafeStr_354

package _-81Y
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_354 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_354(_arg_1:String)
        {
            _SafeStr_3740.push(_arg_1);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = [];
        }


    }
}//package _-81Y

// _SafeStr_354 = "_-o1W" (String#9932, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


