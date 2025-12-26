{% macro function1(x)%}
CASE WHEN TO_TIMESTAMP({{x}}) < CURRENT_DATE THEN 'PAST'
else 'FUTURE' END
{% endmacro %}

{% macro get_season(timestamp_column) %}
    CASE 
        WHEN MONTH(TO_TIMESTAMP({{ timestamp_column }})) IN (12, 1, 2) THEN 'WINTER'
        WHEN MONTH(TO_TIMESTAMP({{ timestamp_column }})) IN (3, 4, 5) THEN 'SPRING'
        WHEN MONTH(TO_TIMESTAMP({{ timestamp_column }})) IN (6, 7, 8) THEN 'SUMMER'
        ELSE 'AUTUMN'
    END
{% endmacro %}
{% macro DAY_TYPE(timestamp_column) %}
CASE 
WHEN DAYNAME(TO_TIMESTAMP({{timestamp_column}})) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END
{% endmacro %}