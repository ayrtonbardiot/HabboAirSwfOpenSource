// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-XO._SafeStr_313

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_313 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_313(_arg_1:int, _arg_2:Boolean=true)
        {
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
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
}//package _-XO

// _SafeStr_313 = "_-L7" (String#7962, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


