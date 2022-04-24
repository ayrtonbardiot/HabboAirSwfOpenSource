// by nota

//_-Po._SafeStr_892

package _-Po
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_892 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_7504:Array = [];


        public function getMessageArray():Array
        {
            var _local_2:int;
            var _local_1:Array = [];
            _local_1.push(this._SafeStr_7504.length);
            _local_2 = 0;
            while (_local_2 < this._SafeStr_7504.length)
            {
                _local_1.push(this._SafeStr_7504[_local_2]);
                _local_2++;
            };
            return (_local_1);
        }

        public function addAcceptedRequest(_arg_1:int):void
        {
            this._SafeStr_7504.push(_arg_1);
        }

        public function dispose():void
        {
            this._SafeStr_7504 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-Po

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_7504 = "_-02K" (String#6508, DoABC#3)
// _SafeStr_892 = "_-T1e" (String#8485, DoABC#3)


