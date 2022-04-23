// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.object.visualization.utils.GraphicAssetCollection

package com.sulake.room.object.visualization.utils
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.assets._SafeStr_21;
    import flash.utils.Dictionary;
    import flash.utils.getTimer;
    import com.sulake.room.utils._SafeStr_1675;
    import flash.utils.ByteArray;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;

    public class GraphicAssetCollection implements IGraphicAssetCollection 
    {

        private static const PALETTE_ASSET_DISPOSE_THRESHOLD:int = 10;
        private static const PALETTE_ATTRIBUTES:Array = ["id", "source"];
        private static const USE_LAZY_ASSETS:Boolean = false;

        private var _assets:_SafeStr_24;
        private var _SafeStr_4154:_SafeStr_21;
        private var _SafeStr_4148:_SafeStr_24;
        private var _SafeStr_4150:Array;
        private var _SafeStr_4149:_SafeStr_24;
        private var _SafeStr_4152:int = 0;
        private var _SafeStr_4153:int = 0;
        private var _SafeStr_4151:Dictionary;

        public function GraphicAssetCollection()
        {
            _assets = new _SafeStr_24();
            _SafeStr_4148 = new _SafeStr_24();
            _SafeStr_4149 = new _SafeStr_24();
            _SafeStr_4150 = [];
            _SafeStr_4151 = new Dictionary();
        }

        public function dispose():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            var _local_3:* = null;
            if (_SafeStr_4148 != null)
            {
                for (_local_2 in _SafeStr_4148)
                {
                    _local_1 = _SafeStr_4148[_local_2];
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                };
                _SafeStr_4148.reset();
            };
            if (_SafeStr_4149 != null)
            {
                _SafeStr_4148.reset();
            };
            if (_SafeStr_4150 != null)
            {
                disposePaletteAssets();
                _SafeStr_4150 = null;
            };
            if (_assets != null)
            {
                for (_local_2 in _assets)
                {
                    _local_3 = _assets[_local_2];
                    if (_local_3 != null)
                    {
                        _local_3.recycle();
                    };
                };
                _assets.reset();
            };
            if (_SafeStr_4151)
            {
                for (var _local_4:String in _SafeStr_4151)
                {
                    delete _SafeStr_4151[_local_4];
                };
            };
            _SafeStr_4154 = null;
        }

        public function set assetLibrary(_arg_1:_SafeStr_21):void
        {
            _SafeStr_4154 = _arg_1;
        }

        public function addReference():void
        {
            _SafeStr_4152++;
            _SafeStr_4153 = getTimer();
        }

        public function removeReference():void
        {
            _SafeStr_4152--;
            if (_SafeStr_4152 <= 0)
            {
                _SafeStr_4152 = 0;
                _SafeStr_4153 = getTimer();
                disposePaletteAssets(false);
            };
        }

        public function getReferenceCount():int
        {
            return (_SafeStr_4152);
        }

        public function getLastReferenceTimeStamp():int
        {
            return (_SafeStr_4153);
        }

        public function define(_arg_1:XML):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            var _local_3:XMLList = _arg_1.asset;
            if (_local_3 == null)
            {
                return (false);
            };
            var _local_2:XMLList = _arg_1.palette;
            if (_local_2 != null)
            {
                definePalettes(_local_2);
            };
            defineAssets(_local_3);
            return (true);
        }

        private function defineAssetsLazy(_arg_1:XMLList):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            for each (_local_2 in _arg_1)
            {
                _local_3 = _local_2.@name;
                if (_local_3.length > 0)
                {
                    _SafeStr_4151[_local_3] = _local_2;
                };
            };
        }

        private function defineAssets(_arg_1:XMLList):void
        {
            var _local_3:int;
            var _local_2:* = null;
            var _local_10:* = null;
            var _local_4:* = null;
            var _local_5:Boolean;
            var _local_11:Boolean;
            var _local_6:Boolean;
            var _local_7:int;
            var _local_9:int;
            var _local_13:* = null;
            var _local_8:Boolean;
            var _local_12:* = null;
            var _local_14:int = _arg_1.length();
            _local_3 = 0;
            while (_local_3 < _local_14)
            {
                _local_2 = _arg_1[_local_3];
                _local_10 = _local_2.@name;
                if (_local_10.length > 0)
                {
                    _local_4 = null;
                    _local_5 = false;
                    _local_11 = false;
                    _local_6 = false;
                    _local_7 = 0;
                    _local_9 = 0;
                    _local_7 = -(int(_local_2.@x));
                    _local_9 = -(int(_local_2.@y));
                    _local_4 = _local_2.@source;
                    if (int(_local_2.@flipH) > 0)
                    {
                        if (_local_4.length > 0)
                        {
                            _local_5 = true;
                        };
                    };
                    if (int(_local_2.@flipV) > 0)
                    {
                        if (_local_4.length > 0)
                        {
                            _local_11 = true;
                        };
                    };
                    _local_6 = (!(int(_local_2.@usesPalette) == 0));
                    if (_local_4.length == 0)
                    {
                        _local_4 = _local_10;
                    };
                    _local_13 = _SafeStr_4154.getAssetByName(_local_4);
                    if (_local_13 != null)
                    {
                        _local_8 = createAsset(_local_10, _local_4, _local_13, _local_5, _local_11, _local_7, _local_9, _local_6);
                        if (!_local_8)
                        {
                            _local_12 = getAsset(_local_10);
                            if (((!(_local_12 == null)) && (!(_local_12.assetName == _local_12.libraryAssetName))))
                            {
                                _local_8 = replaceAsset(_local_10, _local_4, _local_13, _local_5, _local_11, _local_7, _local_9, _local_6);
                            };
                        };
                    };
                };
                _local_3++;
            };
        }

        private function definePalettes(_arg_1:XMLList):void
        {
            var _local_6:* = null;
            var _local_7:* = null;
            var _local_8:* = null;
            var _local_2:* = null;
            var _local_3:int;
            var _local_9:int;
            var _local_10:* = null;
            var _local_4:* = null;
            for each (var _local_5:XML in _arg_1)
            {
                if (_SafeStr_1675.checkRequiredAttributes(_local_5, PALETTE_ATTRIBUTES))
                {
                    _local_6 = _local_5.@id;
                    _local_7 = _local_5.@source;
                    if (_SafeStr_4148[_local_6] == null)
                    {
                        _local_8 = _SafeStr_4154.getAssetByName(_local_7);
                        if (_local_8.content == null)
                        {
                            _SafeStr_14.log(("Palette asset was null: " + _local_7));
                        }
                        else
                        {
                            if ((_local_8.content is Class))
                            {
                                _local_2 = (new ((_local_8.content as Class))() as ByteArray);
                            }
                            else
                            {
                                _local_2 = (_local_8.content as ByteArray);
                            };
                            _local_3 = 0xFFFFFF;
                            _local_9 = 0xFFFFFF;
                            _local_10 = _local_5.@color1;
                            if (_local_10.length > 0)
                            {
                                _local_3 = parseInt(_local_10, 16);
                                _local_9 = _local_3;
                            };
                            _local_10 = _local_5.@color2;
                            if (_local_10.length > 0)
                            {
                                _local_9 = parseInt(_local_10, 16);
                            };
                            _local_4 = new GraphicAssetPalette(_local_2, _local_3, _local_9);
                            _SafeStr_4148[_local_6] = _local_4;
                            _SafeStr_4149[_local_6] = _local_5;
                        };
                    };
                };
            };
        }

        protected function createAsset(_arg_1:String, _arg_2:String, _arg_3:IAsset, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Number, _arg_7:Number, _arg_8:Boolean):Boolean
        {
            if (_assets[_arg_1] != null)
            {
                return (false);
            };
            if (_SafeStr_4151[_arg_1])
            {
                return (false);
            };
            var _local_9:GraphicAsset = GraphicAsset.allocate(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8);
            _assets[_arg_1] = _local_9;
            return (true);
        }

        protected function replaceAsset(_arg_1:String, _arg_2:String, _arg_3:IAsset, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Number, _arg_7:Number, _arg_8:Boolean):Boolean
        {
            var _local_9:GraphicAsset = _assets.remove(_arg_1);
            if (_local_9 != null)
            {
                _local_9.recycle();
            }
            else
            {
                delete _SafeStr_4151[_arg_1];
            };
            return (createAsset(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8));
        }

        public function getAsset(_arg_1:String):IGraphicAsset
        {
            var _local_7:* = null;
            var _local_8:Boolean;
            var _local_6:Boolean;
            var _local_9:Boolean;
            var _local_3:int;
            var _local_4:int;
            var _local_11:* = null;
            var _local_10:* = null;
            var _local_2:IGraphicAsset = _assets.getValue(_arg_1);
            if (_local_2)
            {
                return (_local_2);
            };
            var _local_5:XML = _SafeStr_4151[_arg_1];
            if (_local_5)
            {
                delete _SafeStr_4151[_arg_1];
                _local_7 = null;
                _local_8 = false;
                _local_6 = false;
                _local_9 = false;
                _local_3 = 0;
                _local_4 = 0;
                _local_3 = -(int(_local_5.@x));
                _local_4 = -(int(_local_5.@y));
                _local_7 = _local_5.@source;
                if (int(_local_5.@flipH) > 0)
                {
                    if (_local_7.length > 0)
                    {
                        _local_8 = true;
                    };
                };
                if (int(_local_5.@flipV) > 0)
                {
                    if (_local_7.length > 0)
                    {
                        _local_6 = true;
                    };
                };
                _local_9 = (!(int(_local_5.@usesPalette) == 0));
                if (_local_7.length == 0)
                {
                    _local_7 = _arg_1;
                };
                _local_11 = _SafeStr_4154.getAssetByName(_local_7);
                if (_local_11 != null)
                {
                    if (createAsset(_arg_1, _local_7, _local_11, _local_8, _local_6, _local_3, _local_4, _local_9))
                    {
                        return (_assets[_arg_1]);
                    };
                    _local_10 = getAsset(_arg_1);
                    if (((!(_local_10 == null)) && (!(_local_10.assetName == _local_10.libraryAssetName))))
                    {
                        if (!replaceAsset(_arg_1, _local_7, _local_11, _local_8, _local_6, _local_3, _local_4, _local_9))
                        {
                            return (null);
                        };
                    };
                };
            };
            return (null);
        }

        public function getAssetWithPalette(_arg_1:String, _arg_2:String):IGraphicAsset
        {
            var _local_3:* = null;
            var _local_6:* = null;
            var _local_4:* = null;
            var _local_10:* = null;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_8:String = ((_arg_1 + "@") + _arg_2);
            var _local_9:IGraphicAsset = getAsset(_local_8);
            if (_local_9 == null)
            {
                _local_3 = getAsset(_arg_1);
                if (((_local_3 == null) || (!(_local_3.usesPalette))))
                {
                    return (_local_3);
                };
                _local_6 = ((_local_3.libraryAssetName + "@") + _arg_2);
                _local_4 = getLibraryAsset(_local_6);
                if (_local_4 == null)
                {
                    _local_10 = (_local_3.asset.content as BitmapData);
                    if (_local_10 != null)
                    {
                        _local_7 = getPalette(_arg_2);
                        if (_local_7 != null)
                        {
                            _local_5 = _local_10.clone();
                            _local_7.colorizeBitmap(_local_5);
                            _local_4 = addLibraryAsset(_local_6, _local_5);
                            if (_local_4 == null)
                            {
                                _local_5.dispose();
                                return (null);
                            };
                        }
                        else
                        {
                            return (_local_3);
                        };
                    };
                };
                _SafeStr_4150.push(_local_8);
                createAsset(_local_8, _local_6, _local_4, _local_3.flipH, _local_3.flipV, _local_3.originalOffsetX, _local_3.originalOffsetY, false);
                _local_9 = getAsset(_local_8);
            };
            return (_local_9);
        }

        public function getPaletteNames():Array
        {
            return (_SafeStr_4148.getKeys());
        }

        public function getPaletteColors(_arg_1:String):Array
        {
            var _local_2:GraphicAssetPalette = getPalette(_arg_1);
            if (_local_2 != null)
            {
                return ([_local_2.primaryColor, _local_2.secondaryColor]);
            };
            return (null);
        }

        public function getPaletteXML(_arg_1:String):XML
        {
            return (_SafeStr_4149[_arg_1]);
        }

        private function getPalette(_arg_1:String):GraphicAssetPalette
        {
            return (_SafeStr_4148[_arg_1]);
        }

        public function addAsset(_arg_1:String, _arg_2:BitmapData, _arg_3:Boolean, _arg_4:int=0, _arg_5:int=0, _arg_6:Boolean=false, _arg_7:Boolean=false):Boolean
        {
            var _local_9:* = null;
            if (((_arg_1 == null) || (_arg_2 == null)))
            {
                return (false);
            };
            if (_SafeStr_4154 == null)
            {
                return (false);
            };
            var _local_8:BitmapDataAsset = getLibraryAsset(_arg_1);
            if (_local_8 == null)
            {
                _local_8 = new BitmapDataAsset(_SafeStr_4154.getAssetTypeDeclarationByClass(BitmapDataAsset));
                _SafeStr_4154.setAsset(_arg_1, _local_8);
                _local_8.setUnknownContent(_arg_2);
                return (createAsset(_arg_1, _arg_1, _local_8, _arg_6, _arg_7, _arg_4, _arg_5, false));
            };
            if (_arg_3)
            {
                _local_9 = (_local_8.content as BitmapData);
                if (((!(_local_9 == null)) && (!(_local_9 == _arg_2))))
                {
                    _local_9.dispose();
                };
                _local_8.setUnknownContent(_arg_2);
                return (true);
            };
            return (false);
        }

        public function disposeAsset(_arg_1:String):void
        {
            var _local_3:* = null;
            var _local_2:GraphicAsset = _assets.remove(_arg_1);
            if (_local_2 != null)
            {
                _local_3 = getLibraryAsset(_local_2.libraryAssetName);
                if (_local_3 != null)
                {
                    _SafeStr_4154.removeAsset(_local_3);
                    _local_3.dispose();
                };
                _local_2.recycle();
            }
            else
            {
                delete _SafeStr_4151[_arg_1];
            };
        }

        private function getLibraryAsset(_arg_1:String):BitmapDataAsset
        {
            return (_SafeStr_4154.getAssetByName(_arg_1) as BitmapDataAsset);
        }

        private function addLibraryAsset(_arg_1:String, _arg_2:BitmapData):BitmapDataAsset
        {
            var _local_3:BitmapDataAsset = getLibraryAsset(_arg_1);
            if (_local_3 == null)
            {
                _local_3 = new BitmapDataAsset(_SafeStr_4154.getAssetTypeDeclarationByClass(BitmapDataAsset));
                _SafeStr_4154.setAsset(_arg_1, _local_3);
                _local_3.setUnknownContent(_arg_2);
                return (_local_3);
            };
            return (null);
        }

        private function disposePaletteAssets(_arg_1:Boolean=true):void
        {
            if (_SafeStr_4150 != null)
            {
                if (((_arg_1) || (_SafeStr_4150.length > 10)))
                {
                    for each (var _local_2:String in _SafeStr_4150)
                    {
                        disposeAsset(_local_2);
                    };
                    _SafeStr_4150 = [];
                };
            };
        }


    }
}//package com.sulake.room.object.visualization.utils

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1675 = "_-j1M" (String#2347, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_4148 = "_-71G" (String#2477, DoABC#4)
// _SafeStr_4149 = "_-K14" (String#13394, DoABC#4)
// _SafeStr_4150 = "_-K1u" (String#6008, DoABC#4)
// _SafeStr_4151 = "_-G1X" (String#6013, DoABC#4)
// _SafeStr_4152 = "_-M1t" (String#3975, DoABC#4)
// _SafeStr_4153 = "_-A" (String#12050, DoABC#4)
// _SafeStr_4154 = "_-EZ" (String#4971, DoABC#4)


