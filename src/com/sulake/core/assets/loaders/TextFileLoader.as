// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.assets.loaders.TextFileLoader

package com.sulake.core.assets.loaders
{
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.events.Event;
    import com.probertson.utils._SafeStr_686;
    import flash.errors.IllegalOperationError;

    public class TextFileLoader extends BinaryFileLoader implements _SafeStr_36 
    {

        public function TextFileLoader(_arg_1:String, _arg_2:URLRequest=null, _arg_3:String=null, _arg_4:String=null, _arg_5:ByteArray=null, _arg_6:int=-1)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
        }

        override protected function retry():Boolean
        {
            if (!_disposed)
            {
                if (++_SafeStr_7999 <= _SafeStr_8000)
                {
                    try
                    {
                        _SafeStr_6780.close();
                    }
                    catch(e:Error)
                    {
                    };
                    _SafeStr_6780.load(new URLRequest((((_SafeStr_5275 + ((_SafeStr_5275.indexOf("?") == -1) ? "?" : "&")) + "retry=") + _SafeStr_7999)));
                    return (true);
                };
            };
            return (false);
        }

        override protected function loadEventHandler(_arg_1:Event):void
        {
            if (_arg_1.type == "complete")
            {
                unCompress();
            };
            super.loadEventHandler(_arg_1);
        }

        private function unCompress():void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_1:String = "";
            if ((_SafeStr_6780.data is ByteArray))
            {
                _local_2 = (_SafeStr_6780.data as ByteArray);
                if (_local_2.length == 0)
                {
                    _local_1 = "";
                }
                else
                {
                    try
                    {
                        _local_3 = new _SafeStr_686();
                        _local_1 = _local_3.uncompressToByteArray(_local_2).toString();
                    }
                    catch(error:IllegalOperationError)
                    {
                        _local_2.position = 0;
                        _local_1 = _local_2.readUTFBytes(_local_2.length);
                    };
                };
                _local_2.position = 0;
            }
            else
            {
                _local_1 = (_SafeStr_6780.data as String);
            };
            _SafeStr_6780.data = _local_1;
        }


    }
}//package com.sulake.core.assets.loaders

// _SafeStr_36 = "_-26" (String#6685, DoABC#3)
// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)
// _SafeStr_6780 = "_-Y1l" (String#8851, DoABC#3)
// _SafeStr_686 = "_-v1j" (String#10392, DoABC#3)
// _SafeStr_7999 = "_-t1Z" (String#10256, DoABC#3)
// _SafeStr_8000 = "_-41F" (String#6805, DoABC#3)


