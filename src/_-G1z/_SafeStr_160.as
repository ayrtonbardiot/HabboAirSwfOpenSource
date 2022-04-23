// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-G1z._SafeStr_160

package _-G1z
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_160 implements IMessageComposer 
    {

        private var _SafeStr_3740:Array;

        public function _SafeStr_160(_arg_1:int, _arg_2:int, _arg_3:Array)
        {
            var _local_4:int;
            super();
            _SafeStr_3740 = [_arg_1, _arg_2];
            _SafeStr_3740.push(_arg_3.length);
            _local_4 = 0;
            while (_local_4 < _arg_3.length)
            {
                _SafeStr_3740.push(_arg_3[_local_4]);
                _local_4++;
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
}//package _-G1z

// _SafeStr_160 = "_-m1E" (String#9796, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


