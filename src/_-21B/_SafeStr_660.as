// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-21B._SafeStr_660

package _-21B
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_660 implements IMessageComposer 
    {

        private var _text:String;
        private var _SafeStr_5018:int = 0;
        private var _SafeStr_5982:int = 0;

        public function _SafeStr_660(_arg_1:String, _arg_2:int=0, _arg_3:int=-1)
        {
            _text = _arg_1;
            _SafeStr_5982 = _arg_2;
            _SafeStr_5018 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_text, _SafeStr_5982, _SafeStr_5018]);
        }


    }
}//package _-21B

// _SafeStr_5018 = "_-E1s" (String#7482, DoABC#3)
// _SafeStr_5982 = "_-AQ" (String#7283, DoABC#3)
// _SafeStr_660 = "_-51g" (String#6891, DoABC#3)


