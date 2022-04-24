// by nota

//com.sulake.habbo.quest.seasonalcalendar.Calendar

package com.sulake.habbo.quest.seasonalcalendar
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.quest.HabboQuestEngine;
    import __AS3__.vec.Vector;
    import flash.display.BitmapData;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.utils.Timer;
    import _-41O._SafeStr_1607;
    import com.sulake.core.assets.IAsset;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.window.components.ITextWindow;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    public class Calendar implements _SafeStr_13, _SafeStr_41 
    {

        private static const BG_IMAGE_PREFIX:String = "background_";
        private static const ENTITY_IMAGE_PREFIX:String = "day";
        private static const ENTITY_IMAGE_UNCOMPLETE_POSTFIX:String = "_uncomplete";
        private static const ENTITY_IMAGE_COMPLETED_POSTFIX:String = "_completed";
        private static const SHOW_FUTURE_INACTIVE_ENTITIES_COUNT:int = 2;
        private static const _SafeStr_8693:int = 3;
        private static const ENTITY_SPACING:int = 80;
        private static const ENTITIES_LEFT_MARGIN:int = 37;
        private static const _SafeStr_8694:int = 7;
        private static const DAILY_REFRESH_DELAY_MINUTES:int = 5;
        private static const FLASH_PULSE_LENGHT_IN_MS:int = 2000;
        private static const FLASH_MAX_BRIGHTNESS:int = 100;

        private var _questEngine:HabboQuestEngine;
        private var _SafeStr_4079:MainWindow;
        private var _SafeStr_6003:Array;
        private var _backgroundImageCache:Vector.<BitmapData>;
        private var _graphicEntityCache:Vector.<BitmapData>;
        private var _SafeStr_6874:_SafeStr_24;
        private var _bgAssetNameArray:Array;
        private var _SafeStr_6863:String;
        private var _SafeStr_6864:_SafeStr_3479;
        private var _entityWindows:Vector.<_SafeStr_3133>;
        private var _states:Array;
        private var _SafeStr_6865:CalendarArrowButton;
        private var _SafeStr_6866:CalendarArrowButton;
        private var _SafeStr_4585:_SafeStr_3133;
        private var _SafeStr_6871:_SafeStr_3133;
        private var _SafeStr_6875:_SafeStr_3264;
        private var _SafeStr_6872:int = -1;
        private var _SafeStr_6869:int = -1;
        private var _highestAvailableQuestIndex:int = -1;
        private var _SafeStr_6870:int = 42;
        private var _SafeStr_6867:Timer;
        private var _scrollOffset:int = 0;
        private var _SafeStr_6876:int = 0;
        private var _scrollBgStartOffset:int = 0;
        private var _SafeStr_6873:int = -1;
        private var _SafeStr_6877:int;
        private var _SafeStr_6878:int = -1;
        private var _SafeStr_6879:Boolean = false;
        private var _SafeStr_6880:Boolean = false;
        private var _SafeStr_6868:Timer;
        private var _SafeStr_6881:int = -1;

        public function Calendar(_arg_1:HabboQuestEngine, _arg_2:MainWindow)
        {
            _questEngine = _arg_1;
            _SafeStr_4079 = _arg_2;
        }

        private static function adjustBrightness(_arg_1:uint, _arg_2:int):uint
        {
            var _local_3:int = Math.min(0xFF, Math.max(0, (((_arg_1 >> 16) & 0xFF) + _arg_2)));
            var _local_5:int = Math.min(0xFF, Math.max(0, (((_arg_1 >> 8) & 0xFF) + _arg_2)));
            var _local_4:int = Math.min(0xFF, Math.max(0, ((_arg_1 & 0xFF) + _arg_2)));
            return ((((_local_3 & 0xFF) << 16) + ((_local_5 & 0xFF) << 8)) + (_local_4 & 0xFF));
        }


        private function getImageGalleryHost():String
        {
            return (_SafeStr_6863);
        }

        public function dispose():void
        {
            if (!disposed)
            {
                _questEngine.removeUpdateReceiver(this);
                cleanUpEntityWindows();
                if (_SafeStr_6864 != null)
                {
                    _SafeStr_6864.dispose();
                    _SafeStr_6864 = null;
                };
                if (_SafeStr_6865 != null)
                {
                    _SafeStr_6865.dispose();
                    _SafeStr_6865 = null;
                };
                if (_SafeStr_6866 != null)
                {
                    _SafeStr_6866.dispose();
                    _SafeStr_6866 = null;
                };
                if (_SafeStr_6867 != null)
                {
                    _SafeStr_6867.stop();
                    _SafeStr_6867 = null;
                };
                if (_SafeStr_6868 != null)
                {
                    _SafeStr_6868.stop();
                    _SafeStr_6868 = null;
                };
                _backgroundImageCache = null;
                _graphicEntityCache = null;
                _states = null;
                _SafeStr_6874 = null;
                _bgAssetNameArray = null;
                _questEngine = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_questEngine == null);
        }

        public function onQuests(_arg_1:Array):void
        {
            var _local_4:Date = new Date();
            _SafeStr_6881 = _local_4.getDate();
            var _local_2:int = _SafeStr_6869;
            _SafeStr_6003 = [];
            _highestAvailableQuestIndex = 0;
            var _local_3:_SafeStr_1607;
            for each (_local_3 in _arg_1)
            {
                if (_questEngine.isSeasonalQuest(_local_3))
                {
                    _SafeStr_6003.push(_local_3);
                    if (_highestAvailableQuestIndex < (_local_3.sortOrder - 1))
                    {
                        _highestAvailableQuestIndex = (_local_3.sortOrder - 1);
                    };
                };
            };
            _SafeStr_6003.sortOn(["sortOrder"]);
            _SafeStr_6870 = _questEngine.configuration.getProperty("seasonalQuestCalendar.maximum.entities");
            _SafeStr_6869 = Math.min(_SafeStr_6870, ((_highestAvailableQuestIndex + 1) + 2));
            if (((!(_local_2 == -1)) && (_SafeStr_6869 > _local_2)))
            {
                prepareImages();
            };
        }

        public function prepare(_arg_1:_SafeStr_3263):void
        {
            var _local_2:* = null;
            _SafeStr_6863 = _SafeStr_4079.getCalendarImageGalleryHost();
            _SafeStr_4585 = _SafeStr_3133(_arg_1.findChildByName("calendar_cont"));
            _SafeStr_6875 = _SafeStr_3264(_arg_1.findChildByName("background_slice"));
            _SafeStr_6871 = _SafeStr_3133(_arg_1.findChildByName("entity_template"));
            _SafeStr_6871.visible = false;
            _SafeStr_6864 = new _SafeStr_3479();
            _SafeStr_6865 = new CalendarArrowButton(_questEngine.assets, _SafeStr_3264(_arg_1.findChildByName("button_left")), 0, scrollArrowProcedure);
            _SafeStr_6866 = new CalendarArrowButton(_questEngine.assets, _SafeStr_3264(_arg_1.findChildByName("button_right")), 1, scrollArrowProcedure);
            _local_2 = _SafeStr_3264(_arg_1.findChildByName("stripe_mask_left"));
            _local_2.bitmap = BitmapData(IAsset(_questEngine.assets.getAssetByName("stripe_mask_L")).content);
            _local_2 = _SafeStr_3264(_arg_1.findChildByName("stripe_mask_right"));
            _local_2.bitmap = BitmapData(IAsset(_questEngine.assets.getAssetByName("stripe_mask_R")).content);
            if (_SafeStr_6872 == -1)
            {
                goToDay(_SafeStr_4079.currentDay);
            };
            prepareImages();
            var _local_3:Date = new Date();
            _SafeStr_6881 = _local_3.getDate();
            _SafeStr_6868 = new Timer((60000 * 5));
            _SafeStr_6868.addEventListener("timer", onDateRefreshTimer);
            _SafeStr_6868.start();
            onDateRefreshTimer(new TimerEvent("timer"));
            _questEngine.registerUpdateReceiver(this, 1);
            _SafeStr_6867 = new Timer(10, 10);
        }

        public function close():void
        {
            cleanUpEntityWindows();
            if (_SafeStr_6864 != null)
            {
                _SafeStr_6864.initializeImageChain(new Vector.<BitmapData>());
            };
        }

        public function refresh():void
        {
            var _local_1:int;
            var _local_2:int;
            for each (var _local_3:_SafeStr_1607 in _SafeStr_6003)
            {
                _local_1 = (_local_3.sortOrder - 1);
                _local_2 = ((_local_3.completedCampaign) ? 2 : _states[_local_1]);
                if (_local_2 != _states[_local_1])
                {
                    retrieveEntityImageAsset(_local_3.sortOrder, _local_2);
                    updateEntityIndicatorPanel(_local_1, false);
                    if (((_local_2 == 2) && (_SafeStr_6873 == _local_1)))
                    {
                        stopFlashing();
                    };
                };
            };
            initializeBackgroundRendererIfAllImagesInCache();
            initializeEntitiesIfAllImagesInCache();
        }

        public function goToDay(_arg_1:int):void
        {
            scrollToIndex(Math.max(0, Math.min((_arg_1 - 3), maxScrollRightIndex)));
        }

        private function prepareImages():void
        {
            var _local_6:int;
            var _local_4:int;
            var _local_7:int;
            var _local_2:Boolean;
            var _local_3:int;
            var _local_5:int;
            var _local_1:int = int((Math.ceil((_SafeStr_6869 / 7)) + 1));
            _bgAssetNameArray = new Array(_local_1);
            _backgroundImageCache = new Vector.<BitmapData>(_local_1);
            _graphicEntityCache = new Vector.<BitmapData>(_SafeStr_6869);
            _states = new Array(_SafeStr_6869);
            var _local_8:Vector.<BitmapData> = new Vector.<BitmapData>();
            _local_6 = 0;
            while (_local_6 < _local_1)
            {
                _local_8.push(new BitmapData(640, 320, false, 0xFFFFFF));
                _local_6++;
            };
            _SafeStr_6864.initializeImageChain(_local_8);
            _local_4 = firstBgIndex;
            while (_local_4 <= lastBgIndex)
            {
                retrieveBackgroundImageAsset(_local_4);
                _local_4++;
            };
            _SafeStr_6874 = new _SafeStr_24();
            for each (var _local_9:_SafeStr_1607 in _SafeStr_6003)
            {
                if (_local_9.sortOrder <= _SafeStr_6870)
                {
                    _local_7 = ((_local_9.completedCampaign) ? 2 : 0);
                    _local_2 = (((_local_9.sortOrder - 1) >= firstVisibleIndex) && ((_local_9.sortOrder - 1) <= lastVisibleIndex));
                    retrieveEntityImageAsset(_local_9.sortOrder, _local_7, (!(_local_2)));
                };
            };
            if (_SafeStr_6003.length < _SafeStr_6869)
            {
                _local_3 = (_highestAvailableQuestIndex + 1);
                while (_local_3 < _SafeStr_6869)
                {
                    retrieveEntityImageAsset((_local_3 + 1), 1, (_local_3 > lastVisibleIndex));
                    _local_3++;
                };
            };
            _local_5 = 0;
            while (_local_5 < _SafeStr_6869)
            {
                if (_states[_local_5] == null)
                {
                    retrieveEntityImageAsset((_local_5 + 1), 3, ((_local_5 < firstVisibleIndex) || (_local_5 > lastVisibleIndex)));
                };
                _local_5++;
            };
        }

        private function initializeBackgroundRendererIfAllImagesInCache():void
        {
            var _local_2:int;
            var _local_1:* = null;
            if (!areViewableBackgroundBitmapsInitialized())
            {
                return;
            };
            var _local_4:Array = [];
            var _local_5:Vector.<BitmapData> = new Vector.<BitmapData>();
            _local_2 = 0;
            while (_local_2 < _backgroundImageCache.length)
            {
                _local_1 = _backgroundImageCache[_local_2];
                if (_local_1 != null)
                {
                    _local_5.push(_local_1);
                }
                else
                {
                    _local_5.push(new BitmapData(640, 320, false, 0xFFFFFF));
                    _local_4.push(_local_2);
                };
                _local_2++;
            };
            _SafeStr_6864.initializeImageChain(_local_5);
            assignCurrentBackgroundSlice();
            for each (var _local_3:int in _local_4)
            {
                retrieveBackgroundImageAsset(_local_3);
            };
        }

        private function cleanUpEntityWindows():void
        {
            if (_entityWindows == null)
            {
                return;
            };
            for each (var _local_1:_SafeStr_3109 in _entityWindows)
            {
                _SafeStr_4585.removeChild(_local_1);
                _local_1.dispose();
            };
            _entityWindows = null;
        }

        private function initializeEntitiesIfAllImagesInCache():void
        {
            var _local_8:* = null;
            var _local_6:int;
            var _local_9:* = null;
            var _local_2:* = null;
            var _local_1:* = null;
            var _local_3:* = null;
            if (!areViewableEntityBitmapsInitialized())
            {
                return;
            };
            cleanUpEntityWindows();
            if (_entityWindows == null)
            {
                _entityWindows = new Vector.<_SafeStr_3133>();
            };
            var _local_5:Array = [];
            for each (var _local_4:BitmapData in _graphicEntityCache)
            {
                _local_8 = _SafeStr_3133(_SafeStr_6871.clone());
                _local_6 = _entityWindows.length;
                if (_local_4 != null)
                {
                    _local_9 = (_local_8.findChildByName("entity_bitmap") as _SafeStr_3264);
                    _local_9.width = _local_4.width;
                    _local_9.height = _local_4.height;
                    _local_9.bitmap = _local_4.clone();
                }
                else
                {
                    _local_5.push(_local_6);
                };
                _local_2 = _local_8.findChildByName("entity_mouse_region");
                _local_2.procedure = entityMouseRegionWindowProcedure;
                if ((((_states[_local_6] == 1) || (_states[_local_6] == 2)) || (_states[_local_6] == 3)))
                {
                    _local_2.visible = false;
                };
                _local_8.visible = true;
                _SafeStr_4585.addChild(_local_8);
                _entityWindows.push(_local_8);
                updateEntityIndicatorPanel(_local_6, false);
            };
            repositionEntityWrappers();
            updateEntityVisibilities();
            _local_1 = _SafeStr_4585.findChildByName("stripe_mask_left");
            _SafeStr_4585.setChildIndex(_local_1, (_SafeStr_4585.numChildren - 1));
            _local_1 = _SafeStr_4585.findChildByName("stripe_mask_right");
            _SafeStr_4585.setChildIndex(_local_1, (_SafeStr_4585.numChildren - 1));
            _local_3 = _SafeStr_4585.findChildByName("button_left");
            _SafeStr_4585.setChildIndex(_local_3, (_SafeStr_4585.numChildren - 1));
            _local_3 = _SafeStr_4585.findChildByName("button_right");
            _SafeStr_4585.setChildIndex(_local_3, (_SafeStr_4585.numChildren - 1));
            for each (var _local_7:int in _local_5)
            {
                retrieveEntityImageAsset((_local_7 + 1), _states[_local_7]);
            };
            if (_states[(_SafeStr_4079.currentDay - 1)] == 0)
            {
                startFlashingAtIndex((_SafeStr_4079.currentDay - 1));
            };
        }

        private function get firstVisibleIndex():int
        {
            var _local_1:int = (_SafeStr_6872 - 1);
            return ((_local_1 < 0) ? 0 : _local_1);
        }

        private function get lastVisibleIndex():int
        {
            var _local_2:int = ((_SafeStr_6872 + 7) + 1);
            var _local_1:int = (_SafeStr_6869 - 1);
            return ((_local_2 > _local_1) ? _local_1 : _local_2);
        }

        private function areViewableEntityBitmapsInitialized():Boolean
        {
            var _local_1:int;
            if (_graphicEntityCache == null)
            {
                return (false);
            };
            _local_1 = firstVisibleIndex;
            while (_local_1 <= lastVisibleIndex)
            {
                if (_graphicEntityCache[_local_1] == null)
                {
                    return (false);
                };
                _local_1++;
            };
            return (true);
        }

        private function get firstBgIndex():int
        {
            var _local_2:int = getBackgroundSliceOffset(_SafeStr_6872);
            var _local_1:int = _SafeStr_6864.getImageIndexForOffset(_local_2);
            return ((_local_1 < 0) ? 0 : _local_1);
        }

        private function get lastBgIndex():int
        {
            var _local_1:int = getBackgroundSliceOffset(_SafeStr_6872);
            return (_SafeStr_6864.getImageIndexForOffset((_local_1 + 640)));
        }

        private function areViewableBackgroundBitmapsInitialized():Boolean
        {
            var _local_1:int;
            if (_backgroundImageCache == null)
            {
                return (false);
            };
            var _local_2:int = getBackgroundSliceOffset(_SafeStr_6872);
            _local_1 = firstBgIndex;
            while (_local_1 <= lastBgIndex)
            {
                if (_backgroundImageCache[_local_1] == null)
                {
                    return (false);
                };
                _local_1++;
            };
            return (true);
        }

        private function updateEntityIndicatorPanel(_arg_1:int, _arg_2:Boolean):void
        {
            var _local_6:* = null;
            var _local_7:* = null;
            if (((_entityWindows == null) || (_entityWindows.length < (_arg_1 - 1))))
            {
                return;
            };
            var _local_3:_SafeStr_3195 = _SafeStr_3195(_entityWindows[_arg_1].findChildByName("entity_indicator"));
            var _local_5:uint = CalendarEntityStateEnums.INDICATOR_COLOR[_states[_arg_1]];
            if (_arg_2)
            {
                _local_5 = (_local_5 + 0x202020);
            };
            if (_SafeStr_6873 != _arg_1)
            {
                _local_3.color = _local_5;
            };
            var _local_9:_SafeStr_3264 = _SafeStr_3264(_entityWindows[_arg_1].findChildByName("entity_indicator_status"));
            if (_states[_arg_1] == 2)
            {
                _local_6 = BitmapData(_questEngine.assets.getAssetByName("calendar_quest_complete").content);
                _local_9.width = _local_6.width;
                _local_9.height = _local_6.height;
                _local_9.bitmap = _local_6.clone();
            }
            else
            {
                _local_9.bitmap = null;
            };
            var _local_4:ITextWindow = (_local_3.findChildByName("entity_indicator_text") as ITextWindow);
            var _local_8:_SafeStr_1607 = getQuestByEntityWindowIndex(_arg_1);
            if (_local_8 != null)
            {
                _local_4.text = _questEngine.getCampaignName(_local_8);
            }
            else
            {
                _local_7 = _SafeStr_1607.getCampaignLocalizationKeyForCode(((_questEngine.getSeasonalCampaignCodePrefix() + "_") + (_arg_1 + 1)));
                _local_4.text = _questEngine.getCampaignNameByCode(_local_7);
            };
        }

        private function retrieveEntityImageAsset(_arg_1:int, _arg_2:int, _arg_3:Boolean=false):void
        {
            var _local_4:String = ("day" + _arg_1);
            switch (_arg_2)
            {
                case 0:
                case 1:
                case 3:
                    _local_4 = (_local_4 + "_uncomplete");
                    break;
                case 2:
                    _local_4 = (_local_4 + "_completed");
                default:
            };
            _states[(_arg_1 - 1)] = _arg_2;
            _SafeStr_6874[_local_4] = (_arg_1 - 1);
            var _local_5:IAsset = _questEngine.assets.getAssetByName(_local_4);
            if (_local_5 != null)
            {
                assignEntityBitmapToCacheByAssetName(_local_4);
                initializeEntitiesIfAllImagesInCache();
            }
            else
            {
                if (!_arg_3)
                {
                    loadAssetFromImageGallery(_local_4, onEntityImageAssetDownloaded);
                };
            };
        }

        private function retrieveBackgroundImageAsset(_arg_1:int):void
        {
            var _local_2:String = ("background_" + (_arg_1 + 1));
            _bgAssetNameArray[_arg_1] = _local_2;
            var _local_3:IAsset = _questEngine.assets.getAssetByName(_local_2);
            if (_local_3 != null)
            {
                assignBackgroundBitmapToCacheByAssetName(_local_2);
                initializeBackgroundRendererIfAllImagesInCache();
            }
            else
            {
                loadAssetFromImageGallery(_local_2, onBackgroundImageAssetDownloaded);
            };
        }

        private function loadAssetFromImageGallery(_arg_1:String, _arg_2:Function):void
        {
            var _local_5:String = ((getImageGalleryHost() + _arg_1) + ".png");
            var _local_3:URLRequest = new URLRequest(_local_5);
            var _local_4:AssetLoaderStruct = _questEngine.assets.loadAssetFromFile(_arg_1, _local_3, "image/png");
            if (((_local_4) && (!(_local_4.disposed))))
            {
                _local_4.addEventListener("AssetLoaderEventComplete", _arg_2);
                _local_4.addEventListener("AssetLoaderEventError", _arg_2);
            };
        }

        private function onBackgroundImageAssetDownloaded(_arg_1:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            if (_local_2 != null)
            {
                assignBackgroundBitmapToCacheByAssetName(_local_2.assetName);
            };
            initializeBackgroundRendererIfAllImagesInCache();
        }

        private function onEntityImageAssetDownloaded(_arg_1:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            if (_local_2 != null)
            {
                assignEntityBitmapToCacheByAssetName(_local_2.assetName);
            };
            initializeEntitiesIfAllImagesInCache();
        }

        private function assignBackgroundBitmapToCacheByAssetName(_arg_1:String):void
        {
            var _local_2:int = _bgAssetNameArray.indexOf(_arg_1);
            if (_local_2 == -1)
            {
                return;
            };
            var _local_3:IAsset = _questEngine.assets.getAssetByName(_arg_1);
            _backgroundImageCache[_local_2] = ((_local_3 != null) ? (_local_3.content as BitmapData) : new BitmapData(640, 320));
        }

        private function assignEntityBitmapToCacheByAssetName(_arg_1:String):void
        {
            var _local_3:IAsset = _questEngine.assets.getAssetByName(_arg_1);
            var _local_2:int = _SafeStr_6874[_arg_1];
            if (((_local_2 == -1) || (_local_2 >= _graphicEntityCache.length)))
            {
                return;
            };
            _graphicEntityCache[_local_2] = ((_local_3 != null) ? (_local_3.content as BitmapData) : new BitmapData(1, 1, true, 0));
        }

        private function repositionEntityWrappers():void
        {
            var _local_1:int;
            if (_entityWindows == null)
            {
                return;
            };
            _local_1 = 0;
            while (_local_1 < _entityWindows.length)
            {
                _entityWindows[_local_1].x = ((((_local_1 - _SafeStr_6872) * 80) + _scrollOffset) + 37);
                _local_1++;
            };
        }

        private function getBackgroundSliceOffset(_arg_1:int):int
        {
            return (_arg_1 * 80);
        }

        private function assignCurrentBackgroundSlice():void
        {
            var _local_1:BitmapData = _SafeStr_6864.getSlice(getBackgroundSliceOffset(_SafeStr_6872), _SafeStr_4585.width);
            _SafeStr_6875.x = 0;
            _SafeStr_6875.width = _local_1.width;
            _SafeStr_6875.height = _local_1.height;
            _SafeStr_6875.bitmap = _local_1.clone();
        }

        private function assignScrollableBackgroundSlice(_arg_1:int):void
        {
            var _local_3:* = null;
            var _local_5:int;
            var _local_4:int;
            var _local_2:int;
            var _local_6:int;
            if (_arg_1 < _SafeStr_6872)
            {
                _local_5 = (_SafeStr_6872 - _arg_1);
                _local_4 = getBackgroundSliceOffset(_arg_1);
                _local_3 = _SafeStr_6864.getSlice(_local_4, (_SafeStr_4585.width + (80 * _local_5)));
                _scrollBgStartOffset = -(80 * _local_5);
            }
            else
            {
                _local_2 = (_arg_1 - _SafeStr_6872);
                _local_6 = ((80 * _local_2) + _SafeStr_4585.width);
                _local_3 = _SafeStr_6864.getSlice(getBackgroundSliceOffset(_SafeStr_6872), _local_6);
                _scrollBgStartOffset = 0;
            };
            _SafeStr_6875.x = _scrollBgStartOffset;
            if (_local_3 != null)
            {
                _SafeStr_6875.width = _local_3.width;
                _SafeStr_6875.height = _local_3.height;
                _SafeStr_6875.bitmap = _local_3.clone();
            };
        }

        private function repositionBackgroundSlice():void
        {
            _SafeStr_6875.x = (_scrollBgStartOffset + _scrollOffset);
        }

        private function scrollToIndex(_arg_1:int):void
        {
            if (((_arg_1 < 0) || (_arg_1 >= _SafeStr_6869)))
            {
                return;
            };
            if (((!(_SafeStr_6867 == null)) && (_SafeStr_6867.running)))
            {
                return;
            };
            if (!areViewableEntityBitmapsInitialized())
            {
                _SafeStr_6872 = _arg_1;
                enableScrollArrowsByViewIndex();
                return;
            };
            var _local_2:int = _SafeStr_6872;
            _SafeStr_6872 = _arg_1;
            if (areViewableBackgroundBitmapsInitialized())
            {
                _SafeStr_6872 = _local_2;
                assignScrollableBackgroundSlice(_arg_1);
                updateEntityVisibilities(true, (_arg_1 - _SafeStr_6872));
                _SafeStr_6876 = (-(80 * (_arg_1 - _SafeStr_6872)) / 10);
                _SafeStr_6867 = new Timer(10, 10);
                _SafeStr_6867.addEventListener("timer", onAnimateScroll);
                _SafeStr_6867.addEventListener("timerComplete", onAnimateScroll);
                _SafeStr_6867.start();
            }
            else
            {
                _SafeStr_6872 = _local_2;
            };
        }

        private function get maxScrollRightIndex():int
        {
            return (_SafeStr_6870 - 7);
        }

        private function enableScrollArrowsByViewIndex():void
        {
            if (_SafeStr_6872 > 0)
            {
                _SafeStr_6865.activate();
            }
            else
            {
                _SafeStr_6865.deactivate();
            };
            if (_SafeStr_6872 < Math.min(((_SafeStr_6869 - 3) - 1), maxScrollRightIndex))
            {
                _SafeStr_6866.activate();
            }
            else
            {
                _SafeStr_6866.deactivate();
            };
        }

        private function updateEntityVisibilities(_arg_1:Boolean=false, _arg_2:int=0):void
        {
            var _local_4:int;
            var _local_3:int;
            var _local_5:int;
            if (_entityWindows != null)
            {
                _local_4 = (_SafeStr_6872 - 1);
                if (((_arg_1) && (_arg_2 < 0)))
                {
                    _local_4 = (_local_4 + _arg_2);
                };
                _local_3 = ((_SafeStr_6872 + 7) + 1);
                if (((_arg_1) && (_arg_2 > 0)))
                {
                    _local_3 = (_local_3 + _arg_2);
                };
                _local_5 = 0;
                while (_local_5 < _entityWindows.length)
                {
                    if (((_local_5 < _local_4) || (_local_5 > _local_3)))
                    {
                        _entityWindows[_local_5].visible = false;
                    }
                    else
                    {
                        _entityWindows[_local_5].visible = true;
                        if (((_local_5 == _local_4) || (_local_5 == _local_3)))
                        {
                            _entityWindows[_local_5].getChildByName("entity_mouse_region").visible = false;
                        }
                        else
                        {
                            if (_states[_local_5] == 0)
                            {
                                _entityWindows[_local_5].getChildByName("entity_mouse_region").visible = true;
                            };
                        };
                    };
                    _local_5++;
                };
            };
        }

        private function onAnimateScroll(_arg_1:TimerEvent):void
        {
            switch (_arg_1.type)
            {
                case "timer":
                    _scrollOffset = (_scrollOffset + _SafeStr_6876);
                    repositionBackgroundSlice();
                    repositionEntityWrappers();
                    return;
                case "timerComplete":
                    _scrollOffset = 0;
                    if (_SafeStr_6876 > 0)
                    {
                        _SafeStr_6872 = (_SafeStr_6872 - 1);
                    }
                    else
                    {
                        _SafeStr_6872 = (_SafeStr_6872 + 1);
                    };
                    assignCurrentBackgroundSlice();
                    repositionEntityWrappers();
                    enableScrollArrowsByViewIndex();
                    updateEntityVisibilities();
                    _SafeStr_6867.removeEventListener("timer", onAnimateScroll);
                    _SafeStr_6867.removeEventListener("timerComplete", onAnimateScroll);
                    return;
            };
        }

        private function scrollArrowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_DOWN")
            {
                switch (_arg_2.name)
                {
                    case "button_left":
                        _SafeStr_6879 = true;
                        break;
                    case "button_right":
                        _SafeStr_6880 = true;
                };
            };
            if (((_arg_1.type == "WME_UP") || (_arg_1.type == "WME_UP_OUTSIDE")))
            {
                _SafeStr_6879 = false;
                _SafeStr_6880 = false;
            };
        }

        private function entityMouseRegionWindowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:int;
            var _local_4:* = null;
            if (_arg_2.name == "entity_mouse_region")
            {
                _local_3 = _entityWindows.indexOf((_arg_2.parent as _SafeStr_3133));
                if (_arg_1.type == "WME_CLICK")
                {
                    _local_4 = getQuestByEntityWindowIndex(_local_3);
                    if (_local_4 != null)
                    {
                        _questEngine.questController.questDetails.openDetails(_local_4, true);
                    };
                };
                if (_arg_1.type == "WME_OVER")
                {
                    updateEntityIndicatorPanel(_local_3, true);
                    _SafeStr_6878 = _local_3;
                };
                if (_arg_1.type == "WME_OUT")
                {
                    updateEntityIndicatorPanel(_local_3, false);
                    _SafeStr_6878 = -1;
                };
            };
        }

        private function getQuestByEntityWindowIndex(_arg_1:int):_SafeStr_1607
        {
            for each (var _local_2:_SafeStr_1607 in _SafeStr_6003)
            {
                if ((_local_2.sortOrder - 1) == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function update(_arg_1:uint):void
        {
            var _local_5:int;
            var _local_4:Number;
            var _local_2:* = null;
            var _local_3:Number;
            if (((!(_entityWindows == null)) && (!(_SafeStr_6873 == -1))))
            {
                _local_5 = CalendarEntityStateEnums.INDICATOR_COLOR[_states[_SafeStr_6873]];
                _local_4 = ((_SafeStr_6877 % 2000) / 2000);
                _local_4 = Math.abs((2 * ((_local_4 > 0.5) ? _local_4 = (_local_4 - 1) : _local_4)));
                _local_2 = _SafeStr_3195(_entityWindows[_SafeStr_6873].findChildByName("entity_indicator"));
                if (_local_2)
                {
                    _local_3 = (_local_4 * 100);
                    if (_SafeStr_6878 == _SafeStr_6873)
                    {
                        _local_3 = (_local_3 + 20);
                    };
                    _local_2.color = adjustBrightness(_local_5, _local_3);
                };
                _SafeStr_6877 = (_SafeStr_6877 + _arg_1);
            };
            if (_SafeStr_6867 != null)
            {
                if ((((_SafeStr_6879) && (!(_SafeStr_6867.running))) && (_scrollOffset == 0)))
                {
                    if (((_SafeStr_6872 > 0) && (!(_SafeStr_6865.isInactive()))))
                    {
                        scrollToIndex((_SafeStr_6872 - 1));
                    };
                };
                if ((((_SafeStr_6880) && (!(_SafeStr_6867.running))) && (_scrollOffset == 0)))
                {
                    if (((_SafeStr_6872 < _highestAvailableQuestIndex) && (!(_SafeStr_6866.isInactive()))))
                    {
                        scrollToIndex((_SafeStr_6872 + 1));
                    };
                };
            };
        }

        private function startFlashingAtIndex(_arg_1:int):void
        {
            if (((_arg_1 < 0) || (_arg_1 >= _SafeStr_6869)))
            {
                return;
            };
            _SafeStr_6873 = _arg_1;
            _SafeStr_6877 = 0;
        }

        private function stopFlashing():void
        {
            _SafeStr_6873 = -1;
        }

        private function onDateRefreshTimer(_arg_1:TimerEvent):void
        {
            var _local_2:Date = new Date();
            if (_SafeStr_6881 != _local_2.getDate())
            {
                _questEngine.requestSeasonalQuests();
            };
            _SafeStr_6881 = _local_2.getDate();
        }


    }
}//package com.sulake.habbo.quest.seasonalcalendar

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1607 = "_-oH" (String#1847, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3479 = "_-O1g" (String#11613, DoABC#4)
// _SafeStr_4079 = "_-f1q" (String#323, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4585 = "_-ZD" (String#1375, DoABC#4)
// _SafeStr_6003 = "_-LL" (String#3423, DoABC#4)
// _SafeStr_6863 = "_-DG" (String#22664, DoABC#4)
// _SafeStr_6864 = "_-X16" (String#4846, DoABC#4)
// _SafeStr_6865 = "_-11M" (String#7269, DoABC#4)
// _SafeStr_6866 = "_-Z1q" (String#7834, DoABC#4)
// _SafeStr_6867 = "_-E1t" (String#4124, DoABC#4)
// _SafeStr_6868 = "_-s1l" (String#8545, DoABC#4)
// _SafeStr_6869 = "_-m1I" (String#5092, DoABC#4)
// _SafeStr_6870 = "_-VP" (String#12643, DoABC#4)
// _SafeStr_6871 = "_-W1F" (String#13970, DoABC#4)
// _SafeStr_6872 = "_-e1J" (String#2310, DoABC#4)
// _SafeStr_6873 = "_-E9" (String#6901, DoABC#4)
// _SafeStr_6874 = "_-E1N" (String#11103, DoABC#4)
// _SafeStr_6875 = "_-61k" (String#6007, DoABC#4)
// _SafeStr_6876 = "_-yH" (String#15766, DoABC#4)
// _SafeStr_6877 = "_-Dv" (String#11408, DoABC#4)
// _SafeStr_6878 = "_-nQ" (String#11594, DoABC#4)
// _SafeStr_6879 = "_-d16" (String#12923, DoABC#4)
// _SafeStr_6880 = "_-r1g" (String#11621, DoABC#4)
// _SafeStr_6881 = "_-xu" (String#9402, DoABC#4)
// _SafeStr_8693 = "_-h1o" (String#35666, DoABC#4)
// _SafeStr_8694 = "_-61L" (String#33749, DoABC#4)


