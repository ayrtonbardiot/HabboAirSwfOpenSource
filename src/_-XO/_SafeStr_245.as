// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-XO._SafeStr_245

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_245 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array = [];

        public function _SafeStr_245(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:Array)
        {
            var _local_7:int;
            super();
            _SafeStr_3740.push(_arg_1);
            _SafeStr_3740.push(_arg_2);
            _SafeStr_3740.push(_arg_3);
            _SafeStr_3740.push(_arg_4);
            _SafeStr_3740.push(_arg_5);
            _SafeStr_3740.push(_arg_6.length);
            _local_7 = 0;
            while (_local_7 < _arg_6.length)
            {
                _SafeStr_3740.push(_arg_6[_local_7]);
                _local_7++;
            };
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

// _SafeStr_245 = "_-gN" (String#9424, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


