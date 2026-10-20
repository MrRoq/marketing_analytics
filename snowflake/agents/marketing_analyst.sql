use role sysadmin;

create agent MARKETING_PROD.SEMANTIC.MARKETING_ANALYST
    comment = 'Answers questions about Facebook and Snapchat advertising performance'
    profile = '{"display_name": "Marketing Analyst"}'
from specification
$$
models:
  orchestration: auto

instructions:
  orchestration: >
    Use the paid_ads tool for marketing performance questions.
    Base numerical answers on executed query results.
    Keep spend, CPC, and CPM separated by currency.
    Identify campaigns using both platform and campaign_id.
    Check date coverage before making comparisons across platforms.
    Do not substitute another period if the requested period has no data.

  response: >
    Explain results in plain language.
    State the reporting period and currency where relevant.
    Explain that missing clicks and impressions are treated as zero.
    Do not invent campaign names or infer profitability from clicks.
    If a query fails, explain the failure instead of inventing an answer.

  sample_questions:
    - question: "Show total spend by platform and currency for all available dates."
    - question: "Which Facebook campaigns generated the most clicks in 2025?"

tools:
  - tool_spec:
      type: cortex_analyst_text_to_sql
      name: paid_ads
      description: >
        Answers questions about advertising spend, impressions, clicks,
        CPC, CPM, and campaign performance over time.

tool_resources:
  paid_ads:
    semantic_view: MARKETING_PROD.SEMANTIC.PAID_ADS_PERFORMANCE
    execution_environment:
      type: warehouse
      warehouse: COMPUTE_WH
$$;