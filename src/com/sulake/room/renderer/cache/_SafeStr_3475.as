﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.renderer.cache._SafeStr_3475

package com.sulake.room.renderer.cache
{
    import com.sulake.core.utils._SafeStr_24;
    import __AS3__.vec.Vector;
    import com.sulake.room.data.RoomObjectSpriteData;
    import com.sulake.room.renderer.utils._SafeStr_3417;
    import com.sulake.room.object.enum.RoomObjectSpriteType;
    import com.sulake.habbo.utils.StringUtil;
    import com.sulake.habbo.utils.Canvas;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    [SecureSWF(rename="true")]
    public class _SafeStr_3475 
    {

        private static const MAX_SIZE_FOR_AVG_COLOR:int = 200;

        private var _SafeStr_3740:_SafeStr_24 = null;
        private var _SafeStr_4804:String = "";

        public function _SafeStr_3475(_arg_1:String)
        {
            _SafeStr_4804 = _arg_1;
            _SafeStr_3740 = new _SafeStr_24();
        }

        public function dispose():void
        {
            var _local_2:int;
            var _local_1:* = null;
            if (_SafeStr_3740 != null)
            {
                _local_2 = 0;
                while (_local_2 < _SafeStr_3740.length)
                {
                    _local_1 = (_SafeStr_3740.getWithIndex(_local_2) as _SafeStr_3427);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _local_2++;
                };
                _SafeStr_3740.dispose();
                _SafeStr_3740 = null;
            };
        }

        public function getObjectCache(_arg_1:String):_SafeStr_3427
        {
            var _local_2:_SafeStr_3427 = (_SafeStr_3740.getValue(_arg_1) as _SafeStr_3427);
            if (_local_2 == null)
            {
                _local_2 = new _SafeStr_3427(_SafeStr_4804);
                _SafeStr_3740.add(_arg_1, _local_2);
            };
            return (_local_2);
        }

        public function removeObjectCache(_arg_1:String):void
        {
            var _local_2:_SafeStr_3427 = (_SafeStr_3740.remove(_arg_1) as _SafeStr_3427);
            if (_local_2 != null)
            {
                _local_2.dispose();
            };
        }

        public function getSortableSpriteList():Vector.<RoomObjectSpriteData>
        {
            var _local_3:* = null;
            var _local_6:Boolean;
            var _local_4:Vector.<RoomObjectSpriteData> = new Vector.<RoomObjectSpriteData>();
            var _local_5:Array = _SafeStr_3740.getValues();
            for each (var _local_1:_SafeStr_3427 in _local_5)
            {
                for each (var _local_2:_SafeStr_3417 in _local_1.sprites.sprites)
                {
                    if (((!(_local_2.sprite.spriteType == RoomObjectSpriteType.ROOM_PLANE)) && (!(_local_2.sprite.libraryAssetName == ""))))
                    {
                        _local_3 = new RoomObjectSpriteData();
                        _local_3.objectId = _local_1.objectId;
                        _local_3.x = _local_2.x;
                        _local_3.y = _local_2.y;
                        _local_3.z = _local_2.z;
                        _local_3.name = StringUtil.nonNull(_local_2.sprite.libraryAssetName);
                        _local_3.flipH = _local_2.sprite.flipH;
                        _local_3.alpha = _local_2.sprite.alpha;
                        _local_3.color = _local_2.sprite.color.toString();
                        _local_3.blendMode = _local_2.sprite.blendMode;
                        _local_3.width = _local_2.sprite.width;
                        _local_3.height = _local_2.sprite.height;
                        _local_3.objectType = _local_2.sprite.objectType;
                        _local_3.posture = _local_2.sprite.assetPosture;
                        _local_6 = isSkewedSprite(_local_2.sprite);
                        if (_local_6)
                        {
                            _local_3.skew = (((_local_2.sprite.direction % 4) == 0) ? -0.5 : 0.5);
                        };
                        if ((((((_local_6) || (_local_3.name.indexOf("%image.library.url%") >= 0)) || (_local_3.name.indexOf("%group.badge.url%") >= 0)) && (_local_3.width <= 200)) && (_local_3.height <= 200)))
                        {
                            _local_3.color = Canvas.averageColor(_local_2.sprite.asset).toString();
                            if (_local_2.sprite.objectType.indexOf("external_image_wallitem") == 0)
                            {
                                _local_3.frame = true;
                            };
                        };
                        _local_4.push(_local_3);
                    };
                };
            };
            return (_local_4);
        }

        private function isSkewedSprite(_arg_1:IRoomObjectSprite):Boolean
        {
            if (!_arg_1.objectType)
            {
                return (false);
            };
            if (((_arg_1.objectType.indexOf("external_image_wallitem") == 0) && (_arg_1.tag == "THUMBNAIL")))
            {
                return (true);
            };
            if (((_arg_1.objectType.indexOf("guild_forum") == 0) && (_arg_1.tag == "THUMBNAIL")))
            {
                return (true);
            };
            return (false);
        }

        public function getPlaneSortableSprites():Array
        {
            var _local_3:Array = [];
            var _local_4:Array = _SafeStr_3740.getValues();
            for each (var _local_1:_SafeStr_3427 in _local_4)
            {
                for each (var _local_2:_SafeStr_3417 in _local_1.sprites.sprites)
                {
                    if (_local_2.sprite.spriteType == RoomObjectSpriteType.ROOM_PLANE)
                    {
                        _local_3.push(_local_2);
                    };
                };
            };
            return (_local_3);
        }


    }
}//package com.sulake.room.renderer.cache

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3417 = "_-on" (String#3696, DoABC#4)
// _SafeStr_3427 = "_-J1K" (String#4491, DoABC#4)
// _SafeStr_3475 = "_-9C" (String#13328, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4804 = "_-b1p" (String#6471, DoABC#4)


