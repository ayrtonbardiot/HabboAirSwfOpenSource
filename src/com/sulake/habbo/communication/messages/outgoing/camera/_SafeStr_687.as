// by nota

//com.sulake.habbo.communication.messages.outgoing.camera._SafeStr_687

package com.sulake.habbo.communication.messages.outgoing.camera
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.utils.StringUtil;
    import flash.utils.ByteArray;
    import com.sulake.core.communication.encryption.CryptoTools;
    import com.sulake.room.object.visualization._SafeStr_1318;
    import _-Gf.JsonPlaneDrawingData;
    import _-Gf.JsonMaskDrawingData;
    import _-Gf.JsonPoint;
    import _-Gf.JsonTextureColumnData;
    import com.sulake.core.runtime.exceptions.Exception;

    [SecureSWF(rename="true")]
    public class _SafeStr_687 implements IMessageComposer 
    {

        private const _SafeStr_8396:int = 8100;

        private var _SafeStr_8397:Array;
        private var _SafeStr_8398:String;
        private var _SafeStr_8399:String;
        private var _SafeStr_8400:String = "[]";
        private var roomId:int;
        private var zoomLevel:int = 1;
        private var topSecurityLevel:int;
        private var time:Number;
        protected var _SafeStr_3740:Array = [];

        public function _SafeStr_687(_arg_1:Array, _arg_2:String, _arg_3:String, _arg_4:int, _arg_5:int)
        {
            this._SafeStr_8397 = getRoomPlanesDataArray(_arg_1);
            this._SafeStr_8398 = _arg_2;
            this._SafeStr_8399 = _arg_3;
            this.roomId = _arg_4;
            this.topSecurityLevel = _arg_5;
            time = new Date().getTime();
        }

        private static function planesString():String
        {
            return (StringUtil.makeMagicString(142, 178, 155, 183, 194, 196, 168, 157, 195, 152, 143, 163, 197, 154, 200, 148, 158, 148, 200));
        }

        private static function spritesString():String
        {
            return (StringUtil.makeMagicString(113, 119, 172, 167, 152, 139, 154, 118, 141, 140, 125, 169, 152, 119, 168, 165, 129, 146));
        }

        private static function modifiersString():String
        {
            return (StringUtil.makeMagicString(129, 188, 141, 133, 186, 137, 164, 132, 160, 132, 185, 134, 168, 183, 162, 149, 181, 135));
        }

        private static function filtersString():String
        {
            return (StringUtil.makeMagicString(131, 190, 163, 186, 162, 159, 146, 177, 172, 172, 132, 136, 170, 186, 164, 151, 164));
        }

        private static function roomIdString():String
        {
            return (StringUtil.makeMagicString(122, 181, 177, 127, 144, 130, 147, 129, 125, 157, 126, 145, 142, 145, 170));
        }

        private static function zoomString():String
        {
            return (StringUtil.makeMagicString(126, 132, 128, 180, 166, 134, 158, 167, 151, 148, 133, 132, 181, 159, 146, 158, 159));
        }

        private static function statusString():String
        {
            return (StringUtil.makeMagicString(118, 124, 120, 172, 157, 164, 171, 145, 167, 143, 139, 173, 154, 159, 141, 134, 170));
        }

        private static function timestampString():String
        {
            return (StringUtil.makeMagicString(137, 178, 196, 192, 164, 143, 165, 144, 193, 158, 164, 155, 143, 144, 163, 191, 160, 153, 149, 173, 169, 173, 195));
        }

        private static function checksumString():String
        {
            return (StringUtil.makeMagicString(120, 179, 124, 161, 132, 139, 150, 176, 139, 145, 157, 141, 169, 127, 152, 175, 153, 140, 156, 143));
        }

        private static function jsonEndString():String
        {
            return (StringUtil.makeMagicString(136, 148, 159, 145, 168));
        }

        private static function deflate(_arg_1:String):ByteArray
        {
            var _local_2:ByteArray = new ByteArray();
            _local_2.writeUTFBytes(_arg_1);
            _local_2.compress("zlib");
            return (_local_2);
        }


        public function addEffectData(_arg_1:String):void
        {
            this._SafeStr_8400 = _arg_1;
        }

        public function setZoom(_arg_1:int):void
        {
            this.zoomLevel = _arg_1;
        }

        public function compressData():void
        {
            var roomPlanesDataJsonObj:String = JSON.stringify(_SafeStr_8397, function (_arg_1:Object, _arg_2:Object):*
            {
                if (((_arg_1 == "masks") && (_arg_2.length == 0)))
                {
                    return (undefined);
                };
                return (_arg_2);
            });
            var dataStrJsonObj:String = (((((((((planesString() + roomPlanesDataJsonObj) + spritesString()) + _SafeStr_8398) + modifiersString()) + _SafeStr_8399) + filtersString()) + _SafeStr_8400) + roomIdString()) + roomId);
            if (zoomLevel != 1)
            {
                dataStrJsonObj = (dataStrJsonObj + (zoomString() + zoomLevel));
            };
            var timeLastDigits:int = (time % 100);
            time = (time - timeLastDigits);
            var status:int = int((((time / 100) % 23) + topSecurityLevel));
            dataStrJsonObj = (dataStrJsonObj + (statusString() + status));
            var check:int = dataStrJsonObj.length;
            check = int(((check + ((time / 100) * 17)) % 1493));
            var bytes:ByteArray = CryptoTools.stringToByteArray(dataStrJsonObj);
            var checksum:int = CryptoTools.fletcher100(bytes, check, roomId);
            dataStrJsonObj = (dataStrJsonObj + (timestampString() + (time + checksum)));
            dataStrJsonObj = (dataStrJsonObj + ((checksumString() + ((timeLastDigits + 13) * (check + 29))) + jsonEndString()));
            var deflatedMsg:ByteArray = deflate(dataStrJsonObj);
            _SafeStr_3740 = [deflatedMsg];
        }

        protected function getRoomPlanesDataArray(_arg_1:Array):Array
        {
            var _local_11:* = null;
            var _local_6:*;
            var _local_4:* = null;
            var _local_10:* = null;
            var _local_3:* = null;
            var _local_8:* = null;
            var _local_7:int;
            var _local_13:* = null;
            var _local_2:* = null;
            var _local_9:Array = [];
            for each (var _local_14:_SafeStr_1318 in _arg_1)
            {
                _local_11 = new JsonPlaneDrawingData();
                _local_11.z = _local_14.z;
                _local_6 = _local_14.cornerPoints;
                _local_11.addCornerPoint(_local_6[0].x, _local_6[0].y);
                _local_11.addCornerPoint(_local_6[1].x, _local_6[1].y);
                _local_11.addCornerPoint(_local_6[2].x, _local_6[2].y);
                _local_11.addCornerPoint(_local_6[3].x, _local_6[3].y);
                _local_11.color = _local_14.color;
                _local_4 = _local_14.maskAssetNames;
                _local_10 = _local_14.maskAssetLocations;
                _local_3 = _local_14.maskAssetFlipHs;
                _local_8 = _local_14.maskAssetFlipVs;
                _local_7 = 0;
                while (_local_7 < _local_4.length)
                {
                    _local_11.addMask(new JsonMaskDrawingData(_local_4[_local_7], new JsonPoint(_local_10[_local_7].x, _local_10[_local_7].y), _local_3[_local_7], _local_8[_local_7]));
                    _local_7++;
                };
                _local_11.setBottomAligned(_local_14.isBottomAligned());
                _local_13 = _local_14.assetNameColumns;
                if (_local_13.length != 0)
                {
                    for each (var _local_5:Array in _local_13)
                    {
                        _local_2 = new JsonTextureColumnData();
                        for each (var _local_12:String in _local_5)
                        {
                            _local_2.addAssetName(_local_12);
                        };
                        _local_11.addTexCol(_local_2);
                    };
                };
                _local_9.push(_local_11);
            };
            return (_local_9);
        }

        public function isSendable():Boolean
        {
            if (_SafeStr_3740.length == 0)
            {
                compressData();
            };
            return (_SafeStr_3740[0].length < 8100);
        }

        public function getMessageArray():Array
        {
            if (_SafeStr_3740.length == 0)
            {
                throw (new Exception("Render room message sending attempt before packData() is called."));
            };
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = [];
        }


    }
}//package com.sulake.habbo.communication.messages.outgoing.camera

// _SafeStr_1318 = "_-31X" (String#6721, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_687 = "_-i1T" (String#9530, DoABC#3)
// _SafeStr_8396 = "_-Wf" (String#8749, DoABC#3)
// _SafeStr_8397 = "_-vI" (String#10413, DoABC#3)
// _SafeStr_8398 = "_-x1y" (String#10544, DoABC#3)
// _SafeStr_8399 = "_-uz" (String#10371, DoABC#3)
// _SafeStr_8400 = "_-zm" (String#10700, DoABC#3)


