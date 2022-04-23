// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_SafeStr_2

package 
{
    import flash.net.LocalConnection;
    import flash.display.Sprite;
    import flash.utils.ByteArray;

    public class _SafeStr_2 
    {

        private var _SafeStr_9248:Class = _SafeStr_5;
        private var _SafeStr_9249:Class = _SafeStr_4;


        public function _SafeStr_3524(_arg_1:Sprite):Boolean
        {
            var _local_4:Boolean;
            var _local_5:Boolean;
            var _local_12:String;
            var _local_2:Array = [];
            var _local_3:* = "";
            var _local_6:String = _arg_1.loaderInfo.loaderURL;
            var _local_7:String = new LocalConnection().domain;
            var _local_8:Array = this._SafeStr_3525().split("|");
            var _local_9:int;
            while (_local_9 < _local_8.length)
            {
                _local_12 = (_local_8[_local_9] as String).toLocaleLowerCase();
                if (_local_12 == "?")
                {
                    _local_5 = true;
                }
                else
                {
                    if (_local_12.indexOf("localhost") != -1)
                    {
                        _local_4 = true;
                    }
                    else
                    {
                        if (((_local_12.indexOf("http:") == 0) || (_local_12.indexOf("https:") == 0)))
                        {
                            _local_2.push(_local_12);
                        }
                        else
                        {
                            if (_local_3 != "")
                            {
                                _local_3 = (_local_3 + "|");
                            };
                            if (_local_12.indexOf("*.") != 0) goto _label_2;
                            _local_12 = _local_12.replace("*.", "((\\w|-|_)+\\.)*");
                            goto _label_2;
                        };
                    };
                };
                
            _label_1: 
                _local_9++;
                continue;
                
            _label_2: 
                _local_3 = (_local_3 + _local_12);
                goto _label_1;
            };
            var _local_10:RegExp = new RegExp((("^http(|s)://((www)+\\.)*(" + _local_3) + ")"), "i");
            if (_local_7.toLowerCase() == "localhost")
            {
                if (_local_4)
                {
                    return (true);
                };
                if (_local_5)
                {
                    _arg_1.width = 0;
                    (_arg_1.height = 0);
                    return (false);
                };
            };
            if (_local_10.test(_local_6))
            {
                return (true);
            };
            var _local_11:int;
            while (_local_11 < _local_2.length)
            {
                if (_local_6.indexOf(_local_2[_local_11]) == 0)
                {
                    return (true);
                };
                _local_11++;
            };
            if ((((_local_3.length == 0) && (_local_2.length == 0)) && (_local_5)))
            {
                return (true);
                
            _label_3: 
                _arg_1.height = 0;
                return (false); //goto _label_4;
            };
            _arg_1.width = 0;
            goto _label_3;
            
        _label_4: 
            return (false);
        }

        private function _SafeStr_3525():String
        {
            var _local_1:ByteArray = (new this._SafeStr_9248() as ByteArray);
            var _local_2:_SafeStr_3 = new _SafeStr_3((new this._SafeStr_9249() as ByteArray));
            _local_2._SafeStr_3525(_local_1);
            _local_1.position = 0;
            return (_local_1.readUTFBytes(_local_1.length));
        }


    }
}//package 

// _SafeStr_2 = "_o_-_--" (String#10, DoABC#1)
// _SafeStr_3 = "_o_-__" (String#3, DoABC#1)
// _SafeStr_3524 = "_o_---_" (String#37, DoABC#1)
// _SafeStr_3525 = "_o_-___-" (String#21, DoABC#1)
// _SafeStr_4 = "_o_--" (String#16, DoABC#1)
// _SafeStr_5 = "_o_--_-" (String#17, DoABC#1)
// _SafeStr_9248 = "_o_--_" (String#27, DoABC#1)
// _SafeStr_9249 = "_o_----" (String#26, DoABC#1)


