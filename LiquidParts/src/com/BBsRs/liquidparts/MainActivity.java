package com.BBsRs.liquidparts;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.util.TypedValue;
import android.view.Menu;
import android.view.MenuItem;

import com.BBsRs.liquidparts.R;
import com.astuetz.viewpager.extensions.PagerSlidingTabStrip;

public class MainActivity extends FragmentActivity  {
	
	private PagerSlidingTabStrip tabs;
	private ViewPager pager;
	private MyPagerAdapter adapter;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		getActionBar().setHomeButtonEnabled(true);
		getActionBar().setDisplayHomeAsUpEnabled(true);
		tabs = (PagerSlidingTabStrip) findViewById(R.id.tabs);
		tabs.setTextColorResource(R.color.white);
		tabs.setIndicatorColorResource(R.color.blue);
		tabs.setDividerColorResource(R.color.divider);
		tabs.setUnderlineColorResource(R.color.blue);
		pager = (ViewPager) findViewById(R.id.pager);
		adapter = new MyPagerAdapter(getSupportFragmentManager());
		
		
		pager.setAdapter(adapter);

		final int pageMargin = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 4, getResources()
				.getDisplayMetrics());
		pager.setPageMargin(pageMargin);

		tabs.setViewPager(pager);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}
	
	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
	      switch (item.getItemId()) {
	          case R.id.action_help:
	        	  getApplicationContext().startActivity(new Intent (getApplicationContext(), HelpActivity.class).setFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
	        	  break;
	          case android.R.id.home:
	        	  super. onBackPressed();
	        	  break;
	          default:
	              return super.onOptionsItemSelected(item);

	      }
		return true;
	  }
	
	public class MyPagerAdapter extends FragmentPagerAdapter {

		private final String[] TITLES = getResources().getStringArray(R.array.settings);

		public MyPagerAdapter(FragmentManager fm) {
			super(fm);
		}

		@Override
		public CharSequence getPageTitle(int position) {
			return TITLES[position];
		}

		@Override
		public int getCount() {
			return TITLES.length;
		}

		@Override
		public Fragment getItem(int position) {
			Fragment newContent = null;
			switch (position) {
			case 0:
				newContent = new Tweaks();
				break;
			case 1:
				newContent = new Swap();
				break;
			}
			return newContent;
			
		}

	}

}
